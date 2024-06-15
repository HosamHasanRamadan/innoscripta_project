import 'package:dart_mappable/dart_mappable.dart';
import 'package:innoscripta_project/data/project_color.dart';

part 'project.mapper.dart';

@MappableClass(
  caseStyle: CaseStyle.snakeCase,
)
class Project with ProjectMappable {
  final String id;
  final int order;
  final ProjectColor color;
  final String name;

  Project({
    required this.id,
    required this.order,
    required this.color,
    required this.name,
  });

  factory Project.fromJson(String str) => ProjectMapper.fromJson(str);

  factory Project.fromMap(Map<String, dynamic> map) =>
      ProjectMapper.fromMap(map);

  static List<Project> fromList(List<dynamic> json) {
    return MapperContainer.globals.fromIterable<List<Project>>(json);
  }
}
