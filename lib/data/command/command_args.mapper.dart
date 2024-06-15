// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'command_args.dart';

class CommandArgsMapper extends ClassMapperBase<CommandArgs> {
  CommandArgsMapper._();

  static CommandArgsMapper? _instance;
  static CommandArgsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = CommandArgsMapper._());
      ProjectAddCommandArgsMapper.ensureInitialized();
      SectionAddCommandArgsMapper.ensureInitialized();
      ItemReorderCommandArgsMapper.ensureInitialized();
      ItemMoveCommandArgsMapper.ensureInitialized();
      ItemAddCommandArgsMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'CommandArgs';

  @override
  final MappableFields<CommandArgs> fields = const {};

  static CommandArgs _instantiate(DecodingData data) {
    throw MapperException.missingConstructor('CommandArgs');
  }

  @override
  final Function instantiate = _instantiate;

  static CommandArgs fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<CommandArgs>(map);
  }

  static CommandArgs fromJson(String json) {
    return ensureInitialized().decodeJson<CommandArgs>(json);
  }
}

mixin CommandArgsMappable {
  String toJson();
  Map<String, dynamic> toMap();
  CommandArgsCopyWith<CommandArgs, CommandArgs, CommandArgs> get copyWith;
}

abstract class CommandArgsCopyWith<$R, $In extends CommandArgs, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call();
  CommandArgsCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class ProjectAddCommandArgsMapper
    extends ClassMapperBase<ProjectAddCommandArgs> {
  ProjectAddCommandArgsMapper._();

  static ProjectAddCommandArgsMapper? _instance;
  static ProjectAddCommandArgsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ProjectAddCommandArgsMapper._());
      CommandArgsMapper.ensureInitialized();
      ProjectColorMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'ProjectAddCommandArgs';

  static String _$name(ProjectAddCommandArgs v) => v.name;
  static const Field<ProjectAddCommandArgs, String> _f$name =
      Field('name', _$name);
  static ProjectColor? _$color(ProjectAddCommandArgs v) => v.color;
  static const Field<ProjectAddCommandArgs, ProjectColor> _f$color =
      Field('color', _$color, opt: true);
  static String _$viewStyle(ProjectAddCommandArgs v) => v.viewStyle;
  static const Field<ProjectAddCommandArgs, String> _f$viewStyle =
      Field('viewStyle', _$viewStyle, key: 'view_style');

  @override
  final MappableFields<ProjectAddCommandArgs> fields = const {
    #name: _f$name,
    #color: _f$color,
    #viewStyle: _f$viewStyle,
  };
  @override
  final bool ignoreNull = true;

  static ProjectAddCommandArgs _instantiate(DecodingData data) {
    return ProjectAddCommandArgs(
        name: data.dec(_f$name),
        color: data.dec(_f$color),
        viewStyle: data.dec(_f$viewStyle));
  }

  @override
  final Function instantiate = _instantiate;

  static ProjectAddCommandArgs fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ProjectAddCommandArgs>(map);
  }

  static ProjectAddCommandArgs fromJson(String json) {
    return ensureInitialized().decodeJson<ProjectAddCommandArgs>(json);
  }
}

mixin ProjectAddCommandArgsMappable {
  String toJson() {
    return ProjectAddCommandArgsMapper.ensureInitialized()
        .encodeJson<ProjectAddCommandArgs>(this as ProjectAddCommandArgs);
  }

  Map<String, dynamic> toMap() {
    return ProjectAddCommandArgsMapper.ensureInitialized()
        .encodeMap<ProjectAddCommandArgs>(this as ProjectAddCommandArgs);
  }

  ProjectAddCommandArgsCopyWith<ProjectAddCommandArgs, ProjectAddCommandArgs,
          ProjectAddCommandArgs>
      get copyWith => _ProjectAddCommandArgsCopyWithImpl(
          this as ProjectAddCommandArgs, $identity, $identity);
  @override
  String toString() {
    return ProjectAddCommandArgsMapper.ensureInitialized()
        .stringifyValue(this as ProjectAddCommandArgs);
  }

  @override
  bool operator ==(Object other) {
    return ProjectAddCommandArgsMapper.ensureInitialized()
        .equalsValue(this as ProjectAddCommandArgs, other);
  }

  @override
  int get hashCode {
    return ProjectAddCommandArgsMapper.ensureInitialized()
        .hashValue(this as ProjectAddCommandArgs);
  }
}

extension ProjectAddCommandArgsValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ProjectAddCommandArgs, $Out> {
  ProjectAddCommandArgsCopyWith<$R, ProjectAddCommandArgs, $Out>
      get $asProjectAddCommandArgs =>
          $base.as((v, t, t2) => _ProjectAddCommandArgsCopyWithImpl(v, t, t2));
}

abstract class ProjectAddCommandArgsCopyWith<
    $R,
    $In extends ProjectAddCommandArgs,
    $Out> implements CommandArgsCopyWith<$R, $In, $Out> {
  @override
  $R call({String? name, ProjectColor? color, String? viewStyle});
  ProjectAddCommandArgsCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _ProjectAddCommandArgsCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ProjectAddCommandArgs, $Out>
    implements ProjectAddCommandArgsCopyWith<$R, ProjectAddCommandArgs, $Out> {
  _ProjectAddCommandArgsCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ProjectAddCommandArgs> $mapper =
      ProjectAddCommandArgsMapper.ensureInitialized();
  @override
  $R call({String? name, Object? color = $none, String? viewStyle}) =>
      $apply(FieldCopyWithData({
        if (name != null) #name: name,
        if (color != $none) #color: color,
        if (viewStyle != null) #viewStyle: viewStyle
      }));
  @override
  ProjectAddCommandArgs $make(CopyWithData data) => ProjectAddCommandArgs(
      name: data.get(#name, or: $value.name),
      color: data.get(#color, or: $value.color),
      viewStyle: data.get(#viewStyle, or: $value.viewStyle));

  @override
  ProjectAddCommandArgsCopyWith<$R2, ProjectAddCommandArgs, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _ProjectAddCommandArgsCopyWithImpl($value, $cast, t);
}

class SectionAddCommandArgsMapper
    extends ClassMapperBase<SectionAddCommandArgs> {
  SectionAddCommandArgsMapper._();

  static SectionAddCommandArgsMapper? _instance;
  static SectionAddCommandArgsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = SectionAddCommandArgsMapper._());
      CommandArgsMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'SectionAddCommandArgs';

  static String _$name(SectionAddCommandArgs v) => v.name;
  static const Field<SectionAddCommandArgs, String> _f$name =
      Field('name', _$name);
  static String _$projectId(SectionAddCommandArgs v) => v.projectId;
  static const Field<SectionAddCommandArgs, String> _f$projectId =
      Field('projectId', _$projectId, key: 'project_id');
  static int _$sectionOrder(SectionAddCommandArgs v) => v.sectionOrder;
  static const Field<SectionAddCommandArgs, int> _f$sectionOrder =
      Field('sectionOrder', _$sectionOrder, key: 'section_order');

  @override
  final MappableFields<SectionAddCommandArgs> fields = const {
    #name: _f$name,
    #projectId: _f$projectId,
    #sectionOrder: _f$sectionOrder,
  };

  static SectionAddCommandArgs _instantiate(DecodingData data) {
    return SectionAddCommandArgs(
        name: data.dec(_f$name),
        projectId: data.dec(_f$projectId),
        sectionOrder: data.dec(_f$sectionOrder));
  }

  @override
  final Function instantiate = _instantiate;

  static SectionAddCommandArgs fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<SectionAddCommandArgs>(map);
  }

  static SectionAddCommandArgs fromJson(String json) {
    return ensureInitialized().decodeJson<SectionAddCommandArgs>(json);
  }
}

mixin SectionAddCommandArgsMappable {
  String toJson() {
    return SectionAddCommandArgsMapper.ensureInitialized()
        .encodeJson<SectionAddCommandArgs>(this as SectionAddCommandArgs);
  }

  Map<String, dynamic> toMap() {
    return SectionAddCommandArgsMapper.ensureInitialized()
        .encodeMap<SectionAddCommandArgs>(this as SectionAddCommandArgs);
  }

  SectionAddCommandArgsCopyWith<SectionAddCommandArgs, SectionAddCommandArgs,
          SectionAddCommandArgs>
      get copyWith => _SectionAddCommandArgsCopyWithImpl(
          this as SectionAddCommandArgs, $identity, $identity);
  @override
  String toString() {
    return SectionAddCommandArgsMapper.ensureInitialized()
        .stringifyValue(this as SectionAddCommandArgs);
  }

  @override
  bool operator ==(Object other) {
    return SectionAddCommandArgsMapper.ensureInitialized()
        .equalsValue(this as SectionAddCommandArgs, other);
  }

  @override
  int get hashCode {
    return SectionAddCommandArgsMapper.ensureInitialized()
        .hashValue(this as SectionAddCommandArgs);
  }
}

extension SectionAddCommandArgsValueCopy<$R, $Out>
    on ObjectCopyWith<$R, SectionAddCommandArgs, $Out> {
  SectionAddCommandArgsCopyWith<$R, SectionAddCommandArgs, $Out>
      get $asSectionAddCommandArgs =>
          $base.as((v, t, t2) => _SectionAddCommandArgsCopyWithImpl(v, t, t2));
}

abstract class SectionAddCommandArgsCopyWith<
    $R,
    $In extends SectionAddCommandArgs,
    $Out> implements CommandArgsCopyWith<$R, $In, $Out> {
  @override
  $R call({String? name, String? projectId, int? sectionOrder});
  SectionAddCommandArgsCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _SectionAddCommandArgsCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, SectionAddCommandArgs, $Out>
    implements SectionAddCommandArgsCopyWith<$R, SectionAddCommandArgs, $Out> {
  _SectionAddCommandArgsCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<SectionAddCommandArgs> $mapper =
      SectionAddCommandArgsMapper.ensureInitialized();
  @override
  $R call({String? name, String? projectId, int? sectionOrder}) =>
      $apply(FieldCopyWithData({
        if (name != null) #name: name,
        if (projectId != null) #projectId: projectId,
        if (sectionOrder != null) #sectionOrder: sectionOrder
      }));
  @override
  SectionAddCommandArgs $make(CopyWithData data) => SectionAddCommandArgs(
      name: data.get(#name, or: $value.name),
      projectId: data.get(#projectId, or: $value.projectId),
      sectionOrder: data.get(#sectionOrder, or: $value.sectionOrder));

  @override
  SectionAddCommandArgsCopyWith<$R2, SectionAddCommandArgs, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _SectionAddCommandArgsCopyWithImpl($value, $cast, t);
}

class ItemReorderCommandItemPayloadMapper
    extends ClassMapperBase<ItemReorderCommandItemPayload> {
  ItemReorderCommandItemPayloadMapper._();

  static ItemReorderCommandItemPayloadMapper? _instance;
  static ItemReorderCommandItemPayloadMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = ItemReorderCommandItemPayloadMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'ItemReorderCommandItemPayload';

  static String _$id(ItemReorderCommandItemPayload v) => v.id;
  static const Field<ItemReorderCommandItemPayload, String> _f$id =
      Field('id', _$id);
  static int _$childOrder(ItemReorderCommandItemPayload v) => v.childOrder;
  static const Field<ItemReorderCommandItemPayload, int> _f$childOrder =
      Field('childOrder', _$childOrder, key: 'child_order');

  @override
  final MappableFields<ItemReorderCommandItemPayload> fields = const {
    #id: _f$id,
    #childOrder: _f$childOrder,
  };

  static ItemReorderCommandItemPayload _instantiate(DecodingData data) {
    return ItemReorderCommandItemPayload(
        id: data.dec(_f$id), childOrder: data.dec(_f$childOrder));
  }

  @override
  final Function instantiate = _instantiate;

  static ItemReorderCommandItemPayload fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ItemReorderCommandItemPayload>(map);
  }

  static ItemReorderCommandItemPayload fromJson(String json) {
    return ensureInitialized().decodeJson<ItemReorderCommandItemPayload>(json);
  }
}

mixin ItemReorderCommandItemPayloadMappable {
  String toJson() {
    return ItemReorderCommandItemPayloadMapper.ensureInitialized()
        .encodeJson<ItemReorderCommandItemPayload>(
            this as ItemReorderCommandItemPayload);
  }

  Map<String, dynamic> toMap() {
    return ItemReorderCommandItemPayloadMapper.ensureInitialized()
        .encodeMap<ItemReorderCommandItemPayload>(
            this as ItemReorderCommandItemPayload);
  }

  ItemReorderCommandItemPayloadCopyWith<ItemReorderCommandItemPayload,
          ItemReorderCommandItemPayload, ItemReorderCommandItemPayload>
      get copyWith => _ItemReorderCommandItemPayloadCopyWithImpl(
          this as ItemReorderCommandItemPayload, $identity, $identity);
  @override
  String toString() {
    return ItemReorderCommandItemPayloadMapper.ensureInitialized()
        .stringifyValue(this as ItemReorderCommandItemPayload);
  }

  @override
  bool operator ==(Object other) {
    return ItemReorderCommandItemPayloadMapper.ensureInitialized()
        .equalsValue(this as ItemReorderCommandItemPayload, other);
  }

  @override
  int get hashCode {
    return ItemReorderCommandItemPayloadMapper.ensureInitialized()
        .hashValue(this as ItemReorderCommandItemPayload);
  }
}

extension ItemReorderCommandItemPayloadValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ItemReorderCommandItemPayload, $Out> {
  ItemReorderCommandItemPayloadCopyWith<$R, ItemReorderCommandItemPayload, $Out>
      get $asItemReorderCommandItemPayload => $base.as(
          (v, t, t2) => _ItemReorderCommandItemPayloadCopyWithImpl(v, t, t2));
}

abstract class ItemReorderCommandItemPayloadCopyWith<
    $R,
    $In extends ItemReorderCommandItemPayload,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? id, int? childOrder});
  ItemReorderCommandItemPayloadCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _ItemReorderCommandItemPayloadCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ItemReorderCommandItemPayload, $Out>
    implements
        ItemReorderCommandItemPayloadCopyWith<$R, ItemReorderCommandItemPayload,
            $Out> {
  _ItemReorderCommandItemPayloadCopyWithImpl(
      super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ItemReorderCommandItemPayload> $mapper =
      ItemReorderCommandItemPayloadMapper.ensureInitialized();
  @override
  $R call({String? id, int? childOrder}) => $apply(FieldCopyWithData({
        if (id != null) #id: id,
        if (childOrder != null) #childOrder: childOrder
      }));
  @override
  ItemReorderCommandItemPayload $make(CopyWithData data) =>
      ItemReorderCommandItemPayload(
          id: data.get(#id, or: $value.id),
          childOrder: data.get(#childOrder, or: $value.childOrder));

  @override
  ItemReorderCommandItemPayloadCopyWith<$R2, ItemReorderCommandItemPayload,
      $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _ItemReorderCommandItemPayloadCopyWithImpl($value, $cast, t);
}

class ItemReorderCommandArgsMapper
    extends ClassMapperBase<ItemReorderCommandArgs> {
  ItemReorderCommandArgsMapper._();

  static ItemReorderCommandArgsMapper? _instance;
  static ItemReorderCommandArgsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ItemReorderCommandArgsMapper._());
      CommandArgsMapper.ensureInitialized();
      ItemReorderCommandItemPayloadMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'ItemReorderCommandArgs';

  static List<ItemReorderCommandItemPayload> _$items(
          ItemReorderCommandArgs v) =>
      v.items;
  static const Field<ItemReorderCommandArgs,
      List<ItemReorderCommandItemPayload>> _f$items = Field('items', _$items);

  @override
  final MappableFields<ItemReorderCommandArgs> fields = const {
    #items: _f$items,
  };

  static ItemReorderCommandArgs _instantiate(DecodingData data) {
    return ItemReorderCommandArgs(items: data.dec(_f$items));
  }

  @override
  final Function instantiate = _instantiate;

  static ItemReorderCommandArgs fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ItemReorderCommandArgs>(map);
  }

  static ItemReorderCommandArgs fromJson(String json) {
    return ensureInitialized().decodeJson<ItemReorderCommandArgs>(json);
  }
}

mixin ItemReorderCommandArgsMappable {
  String toJson() {
    return ItemReorderCommandArgsMapper.ensureInitialized()
        .encodeJson<ItemReorderCommandArgs>(this as ItemReorderCommandArgs);
  }

  Map<String, dynamic> toMap() {
    return ItemReorderCommandArgsMapper.ensureInitialized()
        .encodeMap<ItemReorderCommandArgs>(this as ItemReorderCommandArgs);
  }

  ItemReorderCommandArgsCopyWith<ItemReorderCommandArgs, ItemReorderCommandArgs,
          ItemReorderCommandArgs>
      get copyWith => _ItemReorderCommandArgsCopyWithImpl(
          this as ItemReorderCommandArgs, $identity, $identity);
  @override
  String toString() {
    return ItemReorderCommandArgsMapper.ensureInitialized()
        .stringifyValue(this as ItemReorderCommandArgs);
  }

  @override
  bool operator ==(Object other) {
    return ItemReorderCommandArgsMapper.ensureInitialized()
        .equalsValue(this as ItemReorderCommandArgs, other);
  }

  @override
  int get hashCode {
    return ItemReorderCommandArgsMapper.ensureInitialized()
        .hashValue(this as ItemReorderCommandArgs);
  }
}

extension ItemReorderCommandArgsValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ItemReorderCommandArgs, $Out> {
  ItemReorderCommandArgsCopyWith<$R, ItemReorderCommandArgs, $Out>
      get $asItemReorderCommandArgs =>
          $base.as((v, t, t2) => _ItemReorderCommandArgsCopyWithImpl(v, t, t2));
}

abstract class ItemReorderCommandArgsCopyWith<
    $R,
    $In extends ItemReorderCommandArgs,
    $Out> implements CommandArgsCopyWith<$R, $In, $Out> {
  ListCopyWith<
      $R,
      ItemReorderCommandItemPayload,
      ItemReorderCommandItemPayloadCopyWith<$R, ItemReorderCommandItemPayload,
          ItemReorderCommandItemPayload>> get items;
  @override
  $R call({List<ItemReorderCommandItemPayload>? items});
  ItemReorderCommandArgsCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _ItemReorderCommandArgsCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ItemReorderCommandArgs, $Out>
    implements
        ItemReorderCommandArgsCopyWith<$R, ItemReorderCommandArgs, $Out> {
  _ItemReorderCommandArgsCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ItemReorderCommandArgs> $mapper =
      ItemReorderCommandArgsMapper.ensureInitialized();
  @override
  ListCopyWith<
      $R,
      ItemReorderCommandItemPayload,
      ItemReorderCommandItemPayloadCopyWith<$R, ItemReorderCommandItemPayload,
          ItemReorderCommandItemPayload>> get items => ListCopyWith(
      $value.items, (v, t) => v.copyWith.$chain(t), (v) => call(items: v));
  @override
  $R call({List<ItemReorderCommandItemPayload>? items}) =>
      $apply(FieldCopyWithData({if (items != null) #items: items}));
  @override
  ItemReorderCommandArgs $make(CopyWithData data) =>
      ItemReorderCommandArgs(items: data.get(#items, or: $value.items));

  @override
  ItemReorderCommandArgsCopyWith<$R2, ItemReorderCommandArgs, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _ItemReorderCommandArgsCopyWithImpl($value, $cast, t);
}

class ItemMoveCommandArgsMapper extends ClassMapperBase<ItemMoveCommandArgs> {
  ItemMoveCommandArgsMapper._();

  static ItemMoveCommandArgsMapper? _instance;
  static ItemMoveCommandArgsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ItemMoveCommandArgsMapper._());
      CommandArgsMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'ItemMoveCommandArgs';

  static String _$id(ItemMoveCommandArgs v) => v.id;
  static const Field<ItemMoveCommandArgs, String> _f$id = Field('id', _$id);
  static String _$sectionId(ItemMoveCommandArgs v) => v.sectionId;
  static const Field<ItemMoveCommandArgs, String> _f$sectionId =
      Field('sectionId', _$sectionId, key: 'section_id');

  @override
  final MappableFields<ItemMoveCommandArgs> fields = const {
    #id: _f$id,
    #sectionId: _f$sectionId,
  };

  static ItemMoveCommandArgs _instantiate(DecodingData data) {
    return ItemMoveCommandArgs(
        id: data.dec(_f$id), sectionId: data.dec(_f$sectionId));
  }

  @override
  final Function instantiate = _instantiate;

  static ItemMoveCommandArgs fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ItemMoveCommandArgs>(map);
  }

  static ItemMoveCommandArgs fromJson(String json) {
    return ensureInitialized().decodeJson<ItemMoveCommandArgs>(json);
  }
}

mixin ItemMoveCommandArgsMappable {
  String toJson() {
    return ItemMoveCommandArgsMapper.ensureInitialized()
        .encodeJson<ItemMoveCommandArgs>(this as ItemMoveCommandArgs);
  }

  Map<String, dynamic> toMap() {
    return ItemMoveCommandArgsMapper.ensureInitialized()
        .encodeMap<ItemMoveCommandArgs>(this as ItemMoveCommandArgs);
  }

  ItemMoveCommandArgsCopyWith<ItemMoveCommandArgs, ItemMoveCommandArgs,
          ItemMoveCommandArgs>
      get copyWith => _ItemMoveCommandArgsCopyWithImpl(
          this as ItemMoveCommandArgs, $identity, $identity);
  @override
  String toString() {
    return ItemMoveCommandArgsMapper.ensureInitialized()
        .stringifyValue(this as ItemMoveCommandArgs);
  }

  @override
  bool operator ==(Object other) {
    return ItemMoveCommandArgsMapper.ensureInitialized()
        .equalsValue(this as ItemMoveCommandArgs, other);
  }

  @override
  int get hashCode {
    return ItemMoveCommandArgsMapper.ensureInitialized()
        .hashValue(this as ItemMoveCommandArgs);
  }
}

extension ItemMoveCommandArgsValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ItemMoveCommandArgs, $Out> {
  ItemMoveCommandArgsCopyWith<$R, ItemMoveCommandArgs, $Out>
      get $asItemMoveCommandArgs =>
          $base.as((v, t, t2) => _ItemMoveCommandArgsCopyWithImpl(v, t, t2));
}

abstract class ItemMoveCommandArgsCopyWith<$R, $In extends ItemMoveCommandArgs,
    $Out> implements CommandArgsCopyWith<$R, $In, $Out> {
  @override
  $R call({String? id, String? sectionId});
  ItemMoveCommandArgsCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _ItemMoveCommandArgsCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ItemMoveCommandArgs, $Out>
    implements ItemMoveCommandArgsCopyWith<$R, ItemMoveCommandArgs, $Out> {
  _ItemMoveCommandArgsCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ItemMoveCommandArgs> $mapper =
      ItemMoveCommandArgsMapper.ensureInitialized();
  @override
  $R call({String? id, String? sectionId}) => $apply(FieldCopyWithData(
      {if (id != null) #id: id, if (sectionId != null) #sectionId: sectionId}));
  @override
  ItemMoveCommandArgs $make(CopyWithData data) => ItemMoveCommandArgs(
      id: data.get(#id, or: $value.id),
      sectionId: data.get(#sectionId, or: $value.sectionId));

  @override
  ItemMoveCommandArgsCopyWith<$R2, ItemMoveCommandArgs, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _ItemMoveCommandArgsCopyWithImpl($value, $cast, t);
}

class ItemAddCommandArgsMapper extends ClassMapperBase<ItemAddCommandArgs> {
  ItemAddCommandArgsMapper._();

  static ItemAddCommandArgsMapper? _instance;
  static ItemAddCommandArgsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ItemAddCommandArgsMapper._());
      CommandArgsMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'ItemAddCommandArgs';

  static String _$projectId(ItemAddCommandArgs v) => v.projectId;
  static const Field<ItemAddCommandArgs, String> _f$projectId =
      Field('projectId', _$projectId, key: 'project_id');
  static String _$sectionId(ItemAddCommandArgs v) => v.sectionId;
  static const Field<ItemAddCommandArgs, String> _f$sectionId =
      Field('sectionId', _$sectionId, key: 'section_id');
  static String _$content(ItemAddCommandArgs v) => v.content;
  static const Field<ItemAddCommandArgs, String> _f$content =
      Field('content', _$content);
  static int? _$childOrder(ItemAddCommandArgs v) => v.childOrder;
  static const Field<ItemAddCommandArgs, int> _f$childOrder =
      Field('childOrder', _$childOrder, key: 'child_order', opt: true);

  @override
  final MappableFields<ItemAddCommandArgs> fields = const {
    #projectId: _f$projectId,
    #sectionId: _f$sectionId,
    #content: _f$content,
    #childOrder: _f$childOrder,
  };

  static ItemAddCommandArgs _instantiate(DecodingData data) {
    return ItemAddCommandArgs(
        projectId: data.dec(_f$projectId),
        sectionId: data.dec(_f$sectionId),
        content: data.dec(_f$content),
        childOrder: data.dec(_f$childOrder));
  }

  @override
  final Function instantiate = _instantiate;

  static ItemAddCommandArgs fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ItemAddCommandArgs>(map);
  }

  static ItemAddCommandArgs fromJson(String json) {
    return ensureInitialized().decodeJson<ItemAddCommandArgs>(json);
  }
}

mixin ItemAddCommandArgsMappable {
  String toJson() {
    return ItemAddCommandArgsMapper.ensureInitialized()
        .encodeJson<ItemAddCommandArgs>(this as ItemAddCommandArgs);
  }

  Map<String, dynamic> toMap() {
    return ItemAddCommandArgsMapper.ensureInitialized()
        .encodeMap<ItemAddCommandArgs>(this as ItemAddCommandArgs);
  }

  ItemAddCommandArgsCopyWith<ItemAddCommandArgs, ItemAddCommandArgs,
          ItemAddCommandArgs>
      get copyWith => _ItemAddCommandArgsCopyWithImpl(
          this as ItemAddCommandArgs, $identity, $identity);
  @override
  String toString() {
    return ItemAddCommandArgsMapper.ensureInitialized()
        .stringifyValue(this as ItemAddCommandArgs);
  }

  @override
  bool operator ==(Object other) {
    return ItemAddCommandArgsMapper.ensureInitialized()
        .equalsValue(this as ItemAddCommandArgs, other);
  }

  @override
  int get hashCode {
    return ItemAddCommandArgsMapper.ensureInitialized()
        .hashValue(this as ItemAddCommandArgs);
  }
}

extension ItemAddCommandArgsValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ItemAddCommandArgs, $Out> {
  ItemAddCommandArgsCopyWith<$R, ItemAddCommandArgs, $Out>
      get $asItemAddCommandArgs =>
          $base.as((v, t, t2) => _ItemAddCommandArgsCopyWithImpl(v, t, t2));
}

abstract class ItemAddCommandArgsCopyWith<$R, $In extends ItemAddCommandArgs,
    $Out> implements CommandArgsCopyWith<$R, $In, $Out> {
  @override
  $R call(
      {String? projectId, String? sectionId, String? content, int? childOrder});
  ItemAddCommandArgsCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _ItemAddCommandArgsCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ItemAddCommandArgs, $Out>
    implements ItemAddCommandArgsCopyWith<$R, ItemAddCommandArgs, $Out> {
  _ItemAddCommandArgsCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ItemAddCommandArgs> $mapper =
      ItemAddCommandArgsMapper.ensureInitialized();
  @override
  $R call(
          {String? projectId,
          String? sectionId,
          String? content,
          Object? childOrder = $none}) =>
      $apply(FieldCopyWithData({
        if (projectId != null) #projectId: projectId,
        if (sectionId != null) #sectionId: sectionId,
        if (content != null) #content: content,
        if (childOrder != $none) #childOrder: childOrder
      }));
  @override
  ItemAddCommandArgs $make(CopyWithData data) => ItemAddCommandArgs(
      projectId: data.get(#projectId, or: $value.projectId),
      sectionId: data.get(#sectionId, or: $value.sectionId),
      content: data.get(#content, or: $value.content),
      childOrder: data.get(#childOrder, or: $value.childOrder));

  @override
  ItemAddCommandArgsCopyWith<$R2, ItemAddCommandArgs, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _ItemAddCommandArgsCopyWithImpl($value, $cast, t);
}
