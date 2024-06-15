import 'package:dart_mappable/dart_mappable.dart';
import 'package:innoscripta_project/data/task.dart';
import 'package:innoscripta_project/data/tracking_data.dart';
part 'trackable_task.mapper.dart';

@MappableClass(caseStyle: CaseStyle.snakeCase)
class TrackableTask with TrackableTaskMappable {
  final Task task;
  final TrackingData trackingData;
  TrackableTask({
    required this.task,
    this.trackingData = TrackingData.defaultValue,
  });

  factory TrackableTask.fromJson(String str) =>
      TrackableTaskMapper.fromJson(str);

  factory TrackableTask.fromMap(Map<String, dynamic> map) =>
      TrackableTaskMapper.fromMap(map);

  static List<TrackableTask> fromList(List<dynamic> json) {
    return MapperContainer.globals.fromIterable<List<TrackableTask>>(json);
  }
}
