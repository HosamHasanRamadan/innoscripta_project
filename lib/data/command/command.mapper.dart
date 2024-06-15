// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'command.dart';

class CommandTypeMapper extends EnumMapper<CommandType> {
  CommandTypeMapper._();

  static CommandTypeMapper? _instance;
  static CommandTypeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = CommandTypeMapper._());
    }
    return _instance!;
  }

  static CommandType fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  CommandType decode(dynamic value) {
    switch (value) {
      case 'section_add':
        return CommandType.sectionAdd;
      case 'project_add':
        return CommandType.projectAdd;
      case 'item_reorder':
        return CommandType.itemReorder;
      case 'item_move':
        return CommandType.itemMove;
      case 'item_add':
        return CommandType.itemAdd;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(CommandType self) {
    switch (self) {
      case CommandType.sectionAdd:
        return 'section_add';
      case CommandType.projectAdd:
        return 'project_add';
      case CommandType.itemReorder:
        return 'item_reorder';
      case CommandType.itemMove:
        return 'item_move';
      case CommandType.itemAdd:
        return 'item_add';
    }
  }
}

extension CommandTypeMapperExtension on CommandType {
  String toValue() {
    CommandTypeMapper.ensureInitialized();
    return MapperContainer.globals.toValue<CommandType>(this) as String;
  }
}

class CommandMapper extends ClassMapperBase<Command> {
  CommandMapper._();

  static CommandMapper? _instance;
  static CommandMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = CommandMapper._());
      CommandTypeMapper.ensureInitialized();
      CommandArgsMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'Command';
  @override
  Function get typeFactory => <T extends CommandArgs>(f) => f<Command<T>>();

  static CommandType _$type(Command v) => v.type;
  static const Field<Command, CommandType> _f$type = Field('type', _$type);
  static String? _$tempId(Command v) => v.tempId;
  static const Field<Command, String> _f$tempId =
      Field('tempId', _$tempId, key: 'temp_id', opt: true);
  static String _$uuid(Command v) => v.uuid;
  static const Field<Command, String> _f$uuid = Field('uuid', _$uuid);
  static CommandArgs _$args(Command v) => v.args;
  static dynamic _arg$args<T extends CommandArgs>(f) => f<T>();
  static const Field<Command, CommandArgs> _f$args =
      Field('args', _$args, arg: _arg$args);

  @override
  final MappableFields<Command> fields = const {
    #type: _f$type,
    #tempId: _f$tempId,
    #uuid: _f$uuid,
    #args: _f$args,
  };
  @override
  final bool ignoreNull = true;

  static Command<T> _instantiate<T extends CommandArgs>(DecodingData data) {
    return Command(
        type: data.dec(_f$type),
        tempId: data.dec(_f$tempId),
        uuid: data.dec(_f$uuid),
        args: data.dec(_f$args));
  }

  @override
  final Function instantiate = _instantiate;

  static Command<T> fromMap<T extends CommandArgs>(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Command<T>>(map);
  }

  static Command<T> fromJson<T extends CommandArgs>(String json) {
    return ensureInitialized().decodeJson<Command<T>>(json);
  }
}

mixin CommandMappable<T extends CommandArgs> {
  String toJson() {
    return CommandMapper.ensureInitialized()
        .encodeJson<Command<T>>(this as Command<T>);
  }

  Map<String, dynamic> toMap() {
    return CommandMapper.ensureInitialized()
        .encodeMap<Command<T>>(this as Command<T>);
  }

  CommandCopyWith<Command<T>, Command<T>, Command<T>, T> get copyWith =>
      _CommandCopyWithImpl(this as Command<T>, $identity, $identity);
  @override
  String toString() {
    return CommandMapper.ensureInitialized().stringifyValue(this as Command<T>);
  }

  @override
  bool operator ==(Object other) {
    return CommandMapper.ensureInitialized()
        .equalsValue(this as Command<T>, other);
  }

  @override
  int get hashCode {
    return CommandMapper.ensureInitialized().hashValue(this as Command<T>);
  }
}

extension CommandValueCopy<$R, $Out, T extends CommandArgs>
    on ObjectCopyWith<$R, Command<T>, $Out> {
  CommandCopyWith<$R, Command<T>, $Out, T> get $asCommand =>
      $base.as((v, t, t2) => _CommandCopyWithImpl(v, t, t2));
}

abstract class CommandCopyWith<$R, $In extends Command<T>, $Out,
    T extends CommandArgs> implements ClassCopyWith<$R, $In, $Out> {
  $R call({CommandType? type, String? tempId, String? uuid, T? args});
  CommandCopyWith<$R2, $In, $Out2, T> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _CommandCopyWithImpl<$R, $Out, T extends CommandArgs>
    extends ClassCopyWithBase<$R, Command<T>, $Out>
    implements CommandCopyWith<$R, Command<T>, $Out, T> {
  _CommandCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Command> $mapper =
      CommandMapper.ensureInitialized();
  @override
  $R call({CommandType? type, Object? tempId = $none, String? uuid, T? args}) =>
      $apply(FieldCopyWithData({
        if (type != null) #type: type,
        if (tempId != $none) #tempId: tempId,
        if (uuid != null) #uuid: uuid,
        if (args != null) #args: args
      }));
  @override
  Command<T> $make(CopyWithData data) => Command(
      type: data.get(#type, or: $value.type),
      tempId: data.get(#tempId, or: $value.tempId),
      uuid: data.get(#uuid, or: $value.uuid),
      args: data.get(#args, or: $value.args));

  @override
  CommandCopyWith<$R2, Command<T>, $Out2, T> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _CommandCopyWithImpl($value, $cast, t);
}
