import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:innoscripta_project/config/constants.dart';
import 'package:innoscripta_project/data/command/command.dart';
import 'package:innoscripta_project/data/command/command_args.dart';
import 'package:innoscripta_project/data/completed_task.dart';
import 'package:innoscripta_project/data/task.dart';
import 'package:innoscripta_project/data/trackable_completed_task.dart';
import 'package:innoscripta_project/data/trackable_task.dart';
import 'package:innoscripta_project/data/tracking_data.dart';
import 'package:innoscripta_project/repository/sync_repository.dart';
import 'package:innoscripta_project/service/http_client.dart';
import 'package:innoscripta_project/service/local_storage.dart';
import 'package:innoscripta_project/util/date_time_x.dart';
import 'package:innoscripta_project/util/future_x.dart';
import 'package:innoscripta_project/util/pagination.dart';
import 'package:uuid/uuid.dart';

final taskRepositoryProvider = Provider(
  (ref) {
    return TaskRepository(
      ref.watch(httpClientProvider),
      ref.watch(syncRepositoryProvider),
      ref.watch(localStorageProvider),
    );
  },
);

class TaskRepository {
  final Dio httpClient;
  final SyncRepository syncRepository;
  final LocalStorage localStorage;
  const TaskRepository(
    this.httpClient,
    this.syncRepository,
    this.localStorage,
  );

  Future<List<TrackableTask>> getTasks({
    required String projectId,
  }) async {
    final path = Uri(
      path: '${Constants.apiV2Path}/tasks',
      queryParameters: {
        'project_id': projectId,
      },
    );

    final response = await httpClient.getUri<List>(path);

    return _prepareTrackableTasksFrom(Task.fromList(response.data!));
  }

  Future<TrackableTask> getTask({
    required String taskId,
  }) async {
    final path = Uri(path: '${Constants.apiV2Path}/tasks/$taskId');
    final response = await httpClient.getUri<Map>(path);
    return _prepareTrackableTaskFrom(
      Task.fromMap(response.data!.cast<String, dynamic>()),
    );
  }

  Future<TrackableTask> createTask({
    required String projectId,
    required String sectionId,
    required String content,
    String? description,
  }) async {
    final path = Uri(
      path: '${Constants.apiV2Path}/tasks',
      queryParameters: {
        'project_id': projectId,
        'section_id': sectionId,
        'content': content,
        'description': description,
      },
    );
    final response = await httpClient.postUri<Map>(path);
    return _prepareTrackableTaskFrom(
      Task.fromMap(
        response.data!.cast<String, dynamic>(),
      ),
    );
  }

  Future<TrackableTask> updateTask({
    required String taskId,
    String? content,
    String? description,
  }) async {
    final path = Uri(
      path: '${Constants.apiV2Path}/tasks/$taskId',
      queryParameters: {
        if (content != null) 'content': content,
        if (description != null) 'description': description,
      },
    );
    final response = await httpClient.postUri<Map>(path);
    return _prepareTrackableTaskFrom(
      Task.fromMap(
        response.data!.cast<String, dynamic>(),
      ),
    );
  }

  Future<bool> deleteTask({
    required String taskId,
    String? content,
    String? description,
  }) async {
    final path = Uri(
      path: '${Constants.apiV2Path}/tasks/$taskId',
    );
    final response = await httpClient.deleteUri(path).result;
    if (response.isError) return false;
    return true;
  }

  Future<bool> completeTask({
    required String taskId,
    String? content,
    String? description,
  }) async {
    final path = Uri(
      path: '${Constants.apiV2Path}/tasks/$taskId/close',
    );
    final response = await httpClient.postUri(path).result;
    if (response.isError) return false;
    stopTracking(trackableTaskId: taskId);
    return true;
  }

  Future<List<TrackableCompletedTask>> getCompletedTasks({
    required String projectId,
    required int pageSize,
    required int pageNumber,
  }) async {
    final (:limit, :offset) = getLimitAndOffsetFrom(
      pageSize,
      pageNumber,
    );

    final path = Uri(
      path: '${Constants.apiSyncPath}/completed/get_all',
      queryParameters: {
        'project_id': projectId,
        'limit': '$limit',
        'offset': '$offset',
      },
    );

    final response = await httpClient.getUri<Map>(path);
    final itemsMap =
        (response.data!['items'] as List).cast<Map<String, dynamic>>();
    return _prepareTrackableCompletedTasksFrom(
      CompletedTask.fromList(itemsMap),
    );
  }

  Future<bool> updateTrackingData({
    required String trackableTaskId,
    required TrackingData trackingData,
  }) {
    return localStorage.setString(
      trackableTaskId,
      trackingData.toJson(),
    );
  }

  TrackingData startTacking({
    required String trackableTaskId,
  }) {
    var trackingData = localStorage.getTrackingData(trackableTaskId);
    assert(
      trackingData == null || trackingData.isRunning == false,
      'Should start only paused task',
    );

    if (trackingData?.isRunning == true) return trackingData!;

    if (trackingData == null) {
      trackingData = TrackingData(
        durationSpentInSec: 0,
        lastStartTimestamp: DateTime.now().unixTimestamp,
        isRunning: true,
      );
    } else {
      trackingData = trackingData.copyWith(
        lastStartTimestamp: DateTime.now().unixTimestamp,
        isRunning: true,
      );
    }
    localStorage.setString(
      trackableTaskId,
      trackingData.toJson(),
    );
    return trackingData;
  }

  TrackingData stopTracking({
    required String trackableTaskId,
  }) {
    final now = DateTime.now();

    var trackingData = localStorage.getTrackingData(trackableTaskId);
    assert(
      trackingData?.isRunning == true,
      'Should stop only running task',
    );

    if (trackingData == null) return TrackingData.defaultValue;

    if (trackingData.isRunning == false) return trackingData;

    final durationDiff = now.unixTimestamp - trackingData.lastStartTimestamp;
    final newDuration = trackingData.durationSpentInSec + durationDiff;

    trackingData = trackingData.copyWith(
      durationSpentInSec: newDuration,
      isRunning: false,
    );

    localStorage.setString(
      trackableTaskId,
      trackingData.toJson(),
    );
    return trackingData;
  }

  Future<bool> removeTrackingData({
    required String trackableTaskId,
  }) {
    return localStorage.removeKey(
      trackableTaskId,
    );
  }

  Future<bool> moveItemToGroup({
    required String itemId,
    required String toGroupId,
    required List<String> toGroupOrderedIds,
  }) async {
    final uuid = Uuid().v4;

    final itemMoveCommand = Command(
      type: CommandType.itemMove,
      tempId: uuid(),
      uuid: uuid(),
      args: ItemMoveCommandArgs(
        id: itemId,
        sectionId: toGroupId,
      ),
    );

    final groupReorderCommand = _createOrderCommandsFrom(
      toGroupOrderedIds,
    );
    final result = await syncRepository.syncCommands([
      itemMoveCommand,
      groupReorderCommand,
    ]).result;

    return result.isValue;
  }

  Future<bool> moveGroupItem({
    required List<String> groupNewOrderedIds,
  }) async {
    final groupReorderCommand = _createOrderCommandsFrom(
      groupNewOrderedIds,
    );
    final result = await syncRepository.syncCommands(
      [groupReorderCommand],
    ).result;

    return result.isValue;
  }

  TrackableTask _prepareTrackableTaskFrom(Task task) {
    final trackingData =
        localStorage.getTrackingData(task.id) ?? TrackingData.defaultValue;
    return TrackableTask(
      task: task,
      trackingData: trackingData,
    );
  }

  List<TrackableTask> _prepareTrackableTasksFrom(List<Task> tasks) {
    return tasks.map(_prepareTrackableTaskFrom).toList();
  }

  TrackableCompletedTask _prepareTrackableCompletedTaskFrom(
      CompletedTask task) {
    final trackingData =
        localStorage.getTrackingData(task.taskId) ?? TrackingData.defaultValue;
    return TrackableCompletedTask(
      task: task,
      trackingData: trackingData,
    );
  }

  List<TrackableCompletedTask> _prepareTrackableCompletedTasksFrom(
      List<CompletedTask> tasks) {
    return tasks.map(_prepareTrackableCompletedTaskFrom).toList();
  }
}

extension on LocalStorage {
  TrackingData? getTrackingData(String trackableTaskId) {
    final trackDataJson = getString(trackableTaskId);
    if (trackDataJson == null) return null;
    return TrackingData.fromJson(trackDataJson);
  }
}

Command<ItemReorderCommandArgs> _createOrderCommandsFrom(
  List<String> orderedIds,
) {
  final newItemsOrders = <ItemReorderCommandItemPayload>[];
  final uuid = Uuid().v4;
  for (int index = 0; index < orderedIds.length; index++) {
    final id = orderedIds[index];
    newItemsOrders.add(
      ItemReorderCommandItemPayload(
        id: id,
        childOrder: index,
      ),
    );
  }
  final command = Command(
    type: CommandType.itemReorder,
    tempId: uuid(),
    uuid: uuid(),
    args: ItemReorderCommandArgs(
      items: newItemsOrders,
    ),
  );
  return command;
}
