import 'package:dart_mappable/dart_mappable.dart';

part 'command_result.mapper.dart';

typedef UUID = String;

@MappableClass(
  caseStyle: CaseStyle.snakeCase,
)
class CommandResult with CommandResultMappable {
  final bool fullSync;
  final Map<UUID, String> syncStatus;
  final String syncToken;
  final Map<UUID, String> tempIdMapping;

  CommandResult({
    required this.fullSync,
    required this.syncStatus,
    required this.syncToken,
    required this.tempIdMapping,
  });

  factory CommandResult.fromJson(String str) =>
      CommandResultMapper.fromJson(str);

  factory CommandResult.fromMap(Map<String, dynamic> map) =>
      CommandResultMapper.fromMap(map);
}
