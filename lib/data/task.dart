import 'package:dart_mappable/dart_mappable.dart';

part 'task.mapper.dart';

@MappableClass(caseStyle: CaseStyle.snakeCase)
class Task with TaskMappable {
  final int commentCount;
  final bool isCompleted;
  final String content;
  final String? description;
  final String id;
  final int order;
  final String projectId;
  final String sectionId;

  Task({
    required this.commentCount,
    required this.isCompleted,
    required this.content,
    required this.description,
    required this.id,
    required this.order,
    required this.projectId,
    required this.sectionId,
  });

  factory Task.fromJson(String str) => TaskMapper.fromJson(str);

  factory Task.fromMap(Map<String, dynamic> map) => TaskMapper.fromMap(map);

  static List<Task> fromList(List<dynamic> json) {
    return MapperContainer.globals.fromIterable<List<Task>>(json);
  }
}

class RunningInfo {
  final int durationSpentInSec;
  // in unix timestamp sec
  final int lastStartTimestamp;
  final bool isRunning;
  RunningInfo({
    required this.durationSpentInSec,
    required this.lastStartTimestamp,
    required this.isRunning,
  });
}
