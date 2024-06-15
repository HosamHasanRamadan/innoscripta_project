import 'package:dart_mappable/dart_mappable.dart';
import 'package:innoscripta_project/data/completed_task.dart';
import 'package:innoscripta_project/data/task.dart';
import 'package:innoscripta_project/data/tracking_data.dart';

part 'trackable_completed_task.mapper.dart';

@MappableClass(caseStyle: CaseStyle.snakeCase)
class TrackableCompletedTask with TrackableCompletedTaskMappable {
  final CompletedTask task;
  final TrackingData trackingData;
  TrackableCompletedTask({
    required this.task,
    this.trackingData = TrackingData.defaultValue,
  });

  factory TrackableCompletedTask.fromJson(String str) =>
      TrackableCompletedTaskMapper.fromJson(str);

  factory TrackableCompletedTask.fromMap(Map<String, dynamic> map) =>
      TrackableCompletedTaskMapper.fromMap(map);

  static List<TrackableCompletedTask> fromList(List<dynamic> json) {
    return MapperContainer.globals
        .fromIterable<List<TrackableCompletedTask>>(json);
  }
}
