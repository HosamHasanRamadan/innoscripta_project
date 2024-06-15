import 'package:dart_mappable/dart_mappable.dart';

part 'comment.mapper.dart';

@MappableClass(caseStyle: CaseStyle.snakeCase)
class Comment with CommentMappable {
  final String content;
  final String id;
  final DateTime postedAt;
  final String? projectId;
  final String taskId;

  Comment({
    required this.content,
    required this.id,
    required this.postedAt,
    required this.projectId,
    required this.taskId,
  });
  factory Comment.fromJson(String str) => CommentMapper.fromJson(str);

  factory Comment.fromMap(Map<String, dynamic> map) =>
      CommentMapper.fromMap(map);

  static List<Comment> fromList(List<dynamic> json) {
    return MapperContainer.globals.fromIterable<List<Comment>>(json);
  }
}
