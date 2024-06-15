// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'section.dart';

class SectionMapper extends ClassMapperBase<Section> {
  SectionMapper._();

  static SectionMapper? _instance;
  static SectionMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = SectionMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'Section';

  static String _$id(Section v) => v.id;
  static const Field<Section, String> _f$id = Field('id', _$id);
  static String _$projectId(Section v) => v.projectId;
  static const Field<Section, String> _f$projectId =
      Field('projectId', _$projectId, key: 'project_id');
  static int _$order(Section v) => v.order;
  static const Field<Section, int> _f$order = Field('order', _$order);
  static String _$name(Section v) => v.name;
  static const Field<Section, String> _f$name = Field('name', _$name);

  @override
  final MappableFields<Section> fields = const {
    #id: _f$id,
    #projectId: _f$projectId,
    #order: _f$order,
    #name: _f$name,
  };

  static Section _instantiate(DecodingData data) {
    return Section(
        id: data.dec(_f$id),
        projectId: data.dec(_f$projectId),
        order: data.dec(_f$order),
        name: data.dec(_f$name));
  }

  @override
  final Function instantiate = _instantiate;

  static Section fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Section>(map);
  }

  static Section fromJson(String json) {
    return ensureInitialized().decodeJson<Section>(json);
  }
}

mixin SectionMappable {
  String toJson() {
    return SectionMapper.ensureInitialized()
        .encodeJson<Section>(this as Section);
  }

  Map<String, dynamic> toMap() {
    return SectionMapper.ensureInitialized()
        .encodeMap<Section>(this as Section);
  }

  SectionCopyWith<Section, Section, Section> get copyWith =>
      _SectionCopyWithImpl(this as Section, $identity, $identity);
  @override
  String toString() {
    return SectionMapper.ensureInitialized().stringifyValue(this as Section);
  }

  @override
  bool operator ==(Object other) {
    return SectionMapper.ensureInitialized()
        .equalsValue(this as Section, other);
  }

  @override
  int get hashCode {
    return SectionMapper.ensureInitialized().hashValue(this as Section);
  }
}

extension SectionValueCopy<$R, $Out> on ObjectCopyWith<$R, Section, $Out> {
  SectionCopyWith<$R, Section, $Out> get $asSection =>
      $base.as((v, t, t2) => _SectionCopyWithImpl(v, t, t2));
}

abstract class SectionCopyWith<$R, $In extends Section, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? id, String? projectId, int? order, String? name});
  SectionCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _SectionCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, Section, $Out>
    implements SectionCopyWith<$R, Section, $Out> {
  _SectionCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Section> $mapper =
      SectionMapper.ensureInitialized();
  @override
  $R call({String? id, String? projectId, int? order, String? name}) =>
      $apply(FieldCopyWithData({
        if (id != null) #id: id,
        if (projectId != null) #projectId: projectId,
        if (order != null) #order: order,
        if (name != null) #name: name
      }));
  @override
  Section $make(CopyWithData data) => Section(
      id: data.get(#id, or: $value.id),
      projectId: data.get(#projectId, or: $value.projectId),
      order: data.get(#order, or: $value.order),
      name: data.get(#name, or: $value.name));

  @override
  SectionCopyWith<$R2, Section, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _SectionCopyWithImpl($value, $cast, t);
}
