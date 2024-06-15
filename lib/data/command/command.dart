import 'package:dart_mappable/dart_mappable.dart';
import 'package:innoscripta_project/data/command/command_args.dart';
part 'command.mapper.dart';

@MappableClass(
  caseStyle: CaseStyle.snakeCase,
  ignoreNull: true,
)
class Command<T extends CommandArgs> with CommandMappable<T> {
  final CommandType type;
  final String? tempId;
  final String uuid;
  final T args;

  Command({
    required this.type,
    this.tempId,
    required this.uuid,
    required this.args,
  });
}

@MappableEnum(caseStyle: CaseStyle.snakeCase)
enum CommandType {
  sectionAdd,
  projectAdd,
  itemReorder,
  itemMove,
  itemAdd,
}

extension ListX on List<Command> {
  String encode() {
    return MapperContainer.globals.toJson(this);
  }
}
