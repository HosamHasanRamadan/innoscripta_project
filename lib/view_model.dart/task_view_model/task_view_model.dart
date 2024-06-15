import 'dart:async';

import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:innoscripta_project/data/comment.dart';
import 'package:innoscripta_project/data/trackable_task.dart';
import 'package:innoscripta_project/repository/comment_repository.dart';
import 'package:innoscripta_project/repository/task_repository.dart';
import 'package:innoscripta_project/service/global_event_bus.dart';

part 'task_view_model.mapper.dart';

@MappableClass(
  generateMethods: GenerateMethods.copy,
)
class TaskWithComments with TaskWithCommentsMappable {
  final TrackableTask trackableTask;
  final List<Comment> comments;

  TaskWithComments({
    required this.trackableTask,
    required this.comments,
  });
}

final taskViewModelProvider = AsyncNotifierProvider.family
    .autoDispose<TaskViewModel, TaskWithComments, String>(
  TaskViewModel.new,
);

class TaskViewModel
    extends AutoDisposeFamilyAsyncNotifier<TaskWithComments, String> {
  late TaskRepository _taskRepository;
  late CommentRepository _commentRepository;

  @override
  FutureOr<TaskWithComments> build(String taskId) async {
    _taskRepository = ref.watch(taskRepositoryProvider);
    _commentRepository = ref.watch(commentRepositoryProvider);
    final task = await _taskRepository.getTask(taskId: arg);
    final comments = await _commentRepository.getComments(taskId: taskId);

    return TaskWithComments(
      trackableTask: task,
      comments: comments,
    );
  }

  Future<bool> comment(String content) async {
    final result = await AsyncValue.guard(
      () => _commentRepository.createComment(
        taskId: arg,
        content: content,
      ),
    );
    if (result.hasError) return false;
    state = AsyncValue.data(
      state.requireValue.copyWith(
        comments: [
          ...state.requireValue.comments,
          result.requireValue,
        ],
      ),
    );
    return true;
  }

  Future<bool> updateTask({
    required String content,
    String? description,
  }) async {
    final oldState = state;
    state = AsyncData(
      state.requireValue.copyWith.trackableTask.task(
        content: content,
        description: description,
      ),
    );

    final newTask = await AsyncValue.guard(
      () => _taskRepository.updateTask(
        taskId: arg,
        content: content,
        description: description,
      ),
    );
    if (newTask.hasError) {
      state = oldState;
      return false;
    }

    state = AsyncData(
      state.requireValue.copyWith(
        trackableTask: newTask.requireValue,
      ),
    );
    GlobalEventBus.sendEvent(
      name: GlobalEvent.taskUpdated.name,
      payload: {
        'task': newTask.requireValue,
      },
      sender: this,
    );
    return true;
  }
}
