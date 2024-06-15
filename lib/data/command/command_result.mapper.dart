// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'command_result.dart';

class CommandResultMapper extends ClassMapperBase<CommandResult> {
  CommandResultMapper._();

  static CommandResultMapper? _instance;
  static CommandResultMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = CommandResultMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'CommandResult';

  static bool _$fullSync(CommandResult v) => v.fullSync;
  static const Field<CommandResult, bool> _f$fullSync =
      Field('fullSync', _$fullSync, key: 'full_sync');
  static Map<String, String> _$syncStatus(CommandResult v) => v.syncStatus;
  static const Field<CommandResult, Map<String, String>> _f$syncStatus =
      Field('syncStatus', _$syncStatus, key: 'sync_status');
  static String _$syncToken(CommandResult v) => v.syncToken;
  static const Field<CommandResult, String> _f$syncToken =
      Field('syncToken', _$syncToken, key: 'sync_token');
  static Map<String, String> _$tempIdMapping(CommandResult v) =>
      v.tempIdMapping;
  static const Field<CommandResult, Map<String, String>> _f$tempIdMapping =
      Field('tempIdMapping', _$tempIdMapping, key: 'temp_id_mapping');

  @override
  final MappableFields<CommandResult> fields = const {
    #fullSync: _f$fullSync,
    #syncStatus: _f$syncStatus,
    #syncToken: _f$syncToken,
    #tempIdMapping: _f$tempIdMapping,
  };

  static CommandResult _instantiate(DecodingData data) {
    return CommandResult(
        fullSync: data.dec(_f$fullSync),
        syncStatus: data.dec(_f$syncStatus),
        syncToken: data.dec(_f$syncToken),
        tempIdMapping: data.dec(_f$tempIdMapping));
  }

  @override
  final Function instantiate = _instantiate;

  static CommandResult fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<CommandResult>(map);
  }

  static CommandResult fromJson(String json) {
    return ensureInitialized().decodeJson<CommandResult>(json);
  }
}

mixin CommandResultMappable {
  String toJson() {
    return CommandResultMapper.ensureInitialized()
        .encodeJson<CommandResult>(this as CommandResult);
  }

  Map<String, dynamic> toMap() {
    return CommandResultMapper.ensureInitialized()
        .encodeMap<CommandResult>(this as CommandResult);
  }

  CommandResultCopyWith<CommandResult, CommandResult, CommandResult>
      get copyWith => _CommandResultCopyWithImpl(
          this as CommandResult, $identity, $identity);
  @override
  String toString() {
    return CommandResultMapper.ensureInitialized()
        .stringifyValue(this as CommandResult);
  }

  @override
  bool operator ==(Object other) {
    return CommandResultMapper.ensureInitialized()
        .equalsValue(this as CommandResult, other);
  }

  @override
  int get hashCode {
    return CommandResultMapper.ensureInitialized()
        .hashValue(this as CommandResult);
  }
}

extension CommandResultValueCopy<$R, $Out>
    on ObjectCopyWith<$R, CommandResult, $Out> {
  CommandResultCopyWith<$R, CommandResult, $Out> get $asCommandResult =>
      $base.as((v, t, t2) => _CommandResultCopyWithImpl(v, t, t2));
}

abstract class CommandResultCopyWith<$R, $In extends CommandResult, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  MapCopyWith<$R, String, String, ObjectCopyWith<$R, String, String>>
      get syncStatus;
  MapCopyWith<$R, String, String, ObjectCopyWith<$R, String, String>>
      get tempIdMapping;
  $R call(
      {bool? fullSync,
      Map<String, String>? syncStatus,
      String? syncToken,
      Map<String, String>? tempIdMapping});
  CommandResultCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _CommandResultCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, CommandResult, $Out>
    implements CommandResultCopyWith<$R, CommandResult, $Out> {
  _CommandResultCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<CommandResult> $mapper =
      CommandResultMapper.ensureInitialized();
  @override
  MapCopyWith<$R, String, String, ObjectCopyWith<$R, String, String>>
      get syncStatus => MapCopyWith(
          $value.syncStatus,
          (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(syncStatus: v));
  @override
  MapCopyWith<$R, String, String, ObjectCopyWith<$R, String, String>>
      get tempIdMapping => MapCopyWith(
          $value.tempIdMapping,
          (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(tempIdMapping: v));
  @override
  $R call(
          {bool? fullSync,
          Map<String, String>? syncStatus,
          String? syncToken,
          Map<String, String>? tempIdMapping}) =>
      $apply(FieldCopyWithData({
        if (fullSync != null) #fullSync: fullSync,
        if (syncStatus != null) #syncStatus: syncStatus,
        if (syncToken != null) #syncToken: syncToken,
        if (tempIdMapping != null) #tempIdMapping: tempIdMapping
      }));
  @override
  CommandResult $make(CopyWithData data) => CommandResult(
      fullSync: data.get(#fullSync, or: $value.fullSync),
      syncStatus: data.get(#syncStatus, or: $value.syncStatus),
      syncToken: data.get(#syncToken, or: $value.syncToken),
      tempIdMapping: data.get(#tempIdMapping, or: $value.tempIdMapping));

  @override
  CommandResultCopyWith<$R2, CommandResult, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _CommandResultCopyWithImpl($value, $cast, t);
}
