import 'dart:async';

import 'package:appflowy_board/appflowy_board.dart';
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:innoscripta_project/data/project.dart';
import 'package:innoscripta_project/data/section.dart';
import 'package:innoscripta_project/data/trackable_task.dart';
import 'package:innoscripta_project/repository/project_repository.dart';
import 'package:innoscripta_project/repository/section_repository.dart';
import 'package:innoscripta_project/repository/task_repository.dart';
import 'package:innoscripta_project/service/global_event_bus.dart';
import 'package:uuid/uuid.dart';

class ProjectState {
  final String projectId;
  final Project project;
  final AppFlowyBoardController controller;
  ProjectState({
    required this.projectId,
    required this.project,
    required this.controller,
  });
}

class CardBoardItem extends AppFlowyGroupItem {
  final TrackableTask trackableTask;

  CardBoardItem(
    this.trackableTask,
  );

  @override
  String get id => trackableTask.task.id;
}

final projectViewModelProvider = AsyncNotifierProvider.family
    .autoDispose<ProjectViewModel, ProjectState, String>(
  ProjectViewModel.new,
);

class ProjectViewModel
    extends AutoDisposeFamilyAsyncNotifier<ProjectState, String> {
  late ProjectRepository _projectRepository;
  late SectionRepository _sectionRepository;

  late TaskRepository _taskRepository;

  late String projectId;
  late var _controller = AppFlowyBoardController(
    onMoveGroupItem: _onMoveGroupItem,
    onMoveGroupItemToGroup: _onMoveGroupItemToGroup,
  );

  @visibleForTesting
  set controller(AppFlowyBoardController controller) =>
      _controller = controller;

  AppFlowyBoardController get controller => _controller;

  final List<CancelEvent> disposables = [];
  final uuid = Uuid().v4;

  ProjectViewModel() {
    disposables.addAll([
      GlobalEventBus.subscribe(
        receiver: this,
        eventName: GlobalEvent.taskAdded.name,
        onEvent: (event) {
          final trackableTask = event?['task'] as TrackableTask?;
          if (trackableTask == null) return;
          if (trackableTask.task.projectId != projectId) return;
          _addNewTaskLocally(trackableTask);
        },
      ),
      GlobalEventBus.subscribe(
        receiver: this,
        eventName: GlobalEvent.taskUpdated.name,
        onEvent: (event) {
          final trackableTask = event?['task'] as TrackableTask?;
          if (trackableTask == null) return;
          if (trackableTask.task.projectId != projectId) return;
          _updateTaskLocally(trackableTask);
        },
      )
    ]);
  }

  @override
  FutureOr<ProjectState> build(String projectId) async {
    ref.onDispose(dispose);
    this.projectId = projectId;
    _projectRepository = ref.watch(projectRepositoryProvider);
    _sectionRepository = ref.watch(sectionRepositoryProvider);
    _taskRepository = ref.watch(taskRepositoryProvider);

    final projectParts = await Future.wait(
      eagerError: true,
      [
        _projectRepository.getProject(projectId),
        _sectionRepository.getSections(projectId: projectId),
        _taskRepository.getTasks(projectId: projectId),
      ],
    );
    final project = projectParts[0] as Project;
    final sections = projectParts[1] as List<Section>;
    final tasks = projectParts[2] as List<TrackableTask>;

    final groupedTasks = tasks.groupListsBy(
      (element) => element.task.sectionId,
    );

    for (final section in sections) {
      controller.addGroup(
        notify: false,
        AppFlowyGroupData(
          id: section.id,
          name: section.name,
          items: [
            ...?groupedTasks[section.id]?.map((trackableTask) {
              return CardBoardItem(trackableTask);
            }),
          ],
        ),
      );
    }

    return ProjectState(
      projectId: projectId,
      project: project,
      controller: controller,
    );
  }

  Future<bool> deleteTask(CardBoardItem task) async {
    final groupController = controller.getGroupController(
      task.trackableTask.task.sectionId,
    );

    final index = groupController!.items.indexWhere(
      (element) => element.id == task.id,
    );
    if (index >= 0) {
      groupController.removeAt(
        index,
      );
    }
    final isOk = await _taskRepository.deleteTask(taskId: task.id);
    if (isOk) return true;

    groupController.insert(
      index,
      task,
    );
    return false;
  }

  Future<bool> completeTask(CardBoardItem cardItem) async {
    final groupController = controller.getGroupController(
      cardItem.trackableTask.task.sectionId,
    );

    final index = groupController!.items.indexWhere(
      (element) => element.id == cardItem.id,
    );
    if (index >= 0) {
      groupController.removeAt(
        index,
      );
    }
    final isOk = await _taskRepository.completeTask(taskId: cardItem.id);
    if (isOk) return true;

    groupController.insert(
      index,
      cardItem,
    );
    return false;
  }

  void startTracking(CardBoardItem taskCardItem) {
    final updatedTrackingData =
        _taskRepository.startTacking(trackableTaskId: taskCardItem.id);
    final newData = CardBoardItem(taskCardItem.trackableTask.copyWith(
      trackingData: updatedTrackingData,
    ));
    controller.updateGroupItem(
      taskCardItem.trackableTask.task.sectionId,
      newData,
    );
  }

  void stopTracking(CardBoardItem taskCardItem) {
    final updatedTrackingData = _taskRepository.stopTracking(
      trackableTaskId: taskCardItem.id,
    );

    final newData = CardBoardItem(taskCardItem.trackableTask.copyWith(
      trackingData: updatedTrackingData,
    ));

    controller.updateGroupItem(
      taskCardItem.trackableTask.task.sectionId,
      newData,
    );
  }

  void _addNewTaskLocally(TrackableTask newTask) {
    final groupController = controller.getGroupController(
      newTask.task.sectionId,
    );
    groupController?.add(
      CardBoardItem(newTask),
    );
  }

  void _updateTaskLocally(TrackableTask newTask) {
    final groupController =
        controller.getGroupController(newTask.task.sectionId);
    if (groupController == null) return;
    final item = groupController.items.cast<CardBoardItem>().firstWhereOrNull(
          (element) => element.id == newTask.task.id,
        );
    if (item == null) return;

    controller.updateGroupItem(
      newTask.task.sectionId,
      CardBoardItem(
        newTask,
      ),
    );
  }

  void _onMoveGroupItem(
    String groupId,
    int fromIndex,
    int toIndex,
  ) {
    _updateLocalOrder(groupId);
    final groupController = controller.getGroupController(groupId);

    if (groupController == null) return;

    _taskRepository.moveGroupItem(
      groupNewOrderedIds:
          groupController.items.map((element) => element.id).toList(),
    );
  }

  void _onMoveGroupItemToGroup(
    String fromGroupId,
    int fromIndex,
    String toGroupId,
    int toIndex,
  ) {
    _updateLocalOrder(fromGroupId);
    _updateLocalOrder(toGroupId);
    final groupBController = controller.getGroupController(toGroupId);

    if (groupBController == null) return;

    final target = groupBController.items[toIndex] as CardBoardItem;
    _taskRepository.moveItemToGroup(
      itemId: target.id,
      toGroupId: toGroupId,
      toGroupOrderedIds:
          groupBController.items.map((element) => element.id).toList(),
    );

    controller.updateGroupItem(
      toGroupId,
      CardBoardItem(
        target.trackableTask.copyWith.task(
          sectionId: toGroupId,
        ),
      ),
    );
  }

  void _updateLocalOrder(String sectionId) {
    final groupController = controller.getGroupController(sectionId);
    groupController?.items
        .cast<CardBoardItem>()
        .forEachIndexed((index, element) {
      controller.updateGroupItem(
        sectionId,
        CardBoardItem(
          element.trackableTask.copyWith.task(
            order: index,
          ),
        ),
      );
    });
  }

  void dispose() {
    for (var disposer in disposables) {
      disposer();
    }
    controller.dispose();
  }
}
