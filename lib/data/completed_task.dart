import 'package:dart_mappable/dart_mappable.dart';

part 'completed_task.mapper.dart';

@MappableClass(caseStyle: CaseStyle.snakeCase)
class CompletedTask with CompletedTaskMappable {
  final String content;
  final String userId;
  final String taskId;
  final String projectId;
  final String sectionId;
  final DateTime completedAt;
  final String id;

  CompletedTask({
    required this.content,
    required this.userId,
    required this.taskId,
    required this.projectId,
    required this.sectionId,
    required this.completedAt,
    required this.id,
  });

  factory CompletedTask.fromJson(String str) =>
      CompletedTaskMapper.fromJson(str);

  factory CompletedTask.fromMap(Map<String, dynamic> map) =>
      CompletedTaskMapper.fromMap(map);

  static List<CompletedTask> fromList(List<dynamic> json) {
    return MapperContainer.globals.fromIterable<List<CompletedTask>>(json);
  }
}
