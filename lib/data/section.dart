import 'package:dart_mappable/dart_mappable.dart';

part 'section.mapper.dart';

@MappableClass(
  caseStyle: CaseStyle.snakeCase,
)
class Section with SectionMappable {
  String id;
  String projectId;
  int order;
  String name;
  Section({
    required this.id,
    required this.projectId,
    required this.order,
    required this.name,
  });
  factory Section.fromJson(String str) => SectionMapper.fromJson(str);

  factory Section.fromMap(Map<String, dynamic> map) =>
      SectionMapper.fromMap(map);

  static List<Section> fromList(List<dynamic> json) {
    return MapperContainer.globals.fromIterable<List<Section>>(json);
  }
}
