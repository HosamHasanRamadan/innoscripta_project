import 'package:dart_mappable/dart_mappable.dart';

import 'package:innoscripta_project/data/project_color.dart';

part 'command_args.mapper.dart';

@MappableClass()
abstract interface class CommandArgs with CommandArgsMappable {}

@MappableClass(
  caseStyle: CaseStyle.snakeCase,
  ignoreNull: true,
)
class ProjectAddCommandArgs
    with ProjectAddCommandArgsMappable
    implements CommandArgs {
  final String name;
  final ProjectColor? color;
  final String viewStyle;

  ProjectAddCommandArgs({
    required this.name,
    this.color,
    required this.viewStyle,
  });
}

@MappableClass(
  caseStyle: CaseStyle.snakeCase,
)
class SectionAddCommandArgs
    with SectionAddCommandArgsMappable
    implements CommandArgs {
  final String name;
  final String projectId;
  final int sectionOrder;

  SectionAddCommandArgs({
    required this.name,
    required this.projectId,
    required this.sectionOrder,
  });
}

@MappableClass(caseStyle: CaseStyle.snakeCase)
class ItemReorderCommandItemPayload with ItemReorderCommandItemPayloadMappable {
  final String id;
  final int childOrder;
  ItemReorderCommandItemPayload({
    required this.id,
    required this.childOrder,
  });
}

@MappableClass(caseStyle: CaseStyle.snakeCase)
class ItemReorderCommandArgs
    with ItemReorderCommandArgsMappable
    implements CommandArgs {
  final List<ItemReorderCommandItemPayload> items;

  ItemReorderCommandArgs({
    required this.items,
  });
}

@MappableClass(caseStyle: CaseStyle.snakeCase)
class ItemMoveCommandArgs
    with ItemMoveCommandArgsMappable
    implements CommandArgs {
  final String id;
  final String sectionId;

  ItemMoveCommandArgs({
    required this.id,
    required this.sectionId,
  });
}

@MappableClass(caseStyle: CaseStyle.snakeCase)
class ItemAddCommandArgs
    with ItemAddCommandArgsMappable
    implements CommandArgs {
  final String projectId;
  final String sectionId;
  final String content;
  final int? childOrder;

  ItemAddCommandArgs({
    required this.projectId,
    required this.sectionId,
    required this.content,
    this.childOrder,
  });
}
