// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'project.dart';

class ProjectMapper extends ClassMapperBase<Project> {
  ProjectMapper._();

  static ProjectMapper? _instance;
  static ProjectMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ProjectMapper._());
      ProjectColorMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'Project';

  static String _$id(Project v) => v.id;
  static const Field<Project, String> _f$id = Field('id', _$id);
  static int _$order(Project v) => v.order;
  static const Field<Project, int> _f$order = Field('order', _$order);
  static ProjectColor _$color(Project v) => v.color;
  static const Field<Project, ProjectColor> _f$color = Field('color', _$color);
  static String _$name(Project v) => v.name;
  static const Field<Project, String> _f$name = Field('name', _$name);

  @override
  final MappableFields<Project> fields = const {
    #id: _f$id,
    #order: _f$order,
    #color: _f$color,
    #name: _f$name,
  };

  static Project _instantiate(DecodingData data) {
    return Project(
        id: data.dec(_f$id),
        order: data.dec(_f$order),
        color: data.dec(_f$color),
        name: data.dec(_f$name));
  }

  @override
  final Function instantiate = _instantiate;

  static Project fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Project>(map);
  }

  static Project fromJson(String json) {
    return ensureInitialized().decodeJson<Project>(json);
  }
}

mixin ProjectMappable {
  String toJson() {
    return ProjectMapper.ensureInitialized()
        .encodeJson<Project>(this as Project);
  }

  Map<String, dynamic> toMap() {
    return ProjectMapper.ensureInitialized()
        .encodeMap<Project>(this as Project);
  }

  ProjectCopyWith<Project, Project, Project> get copyWith =>
      _ProjectCopyWithImpl(this as Project, $identity, $identity);
  @override
  String toString() {
    return ProjectMapper.ensureInitialized().stringifyValue(this as Project);
  }

  @override
  bool operator ==(Object other) {
    return ProjectMapper.ensureInitialized()
        .equalsValue(this as Project, other);
  }

  @override
  int get hashCode {
    return ProjectMapper.ensureInitialized().hashValue(this as Project);
  }
}

extension ProjectValueCopy<$R, $Out> on ObjectCopyWith<$R, Project, $Out> {
  ProjectCopyWith<$R, Project, $Out> get $asProject =>
      $base.as((v, t, t2) => _ProjectCopyWithImpl(v, t, t2));
}

abstract class ProjectCopyWith<$R, $In extends Project, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? id, int? order, ProjectColor? color, String? name});
  ProjectCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ProjectCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, Project, $Out>
    implements ProjectCopyWith<$R, Project, $Out> {
  _ProjectCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Project> $mapper =
      ProjectMapper.ensureInitialized();
  @override
  $R call({String? id, int? order, ProjectColor? color, String? name}) =>
      $apply(FieldCopyWithData({
        if (id != null) #id: id,
        if (order != null) #order: order,
        if (color != null) #color: color,
        if (name != null) #name: name
      }));
  @override
  Project $make(CopyWithData data) => Project(
      id: data.get(#id, or: $value.id),
      order: data.get(#order, or: $value.order),
      color: data.get(#color, or: $value.color),
      name: data.get(#name, or: $value.name));

  @override
  ProjectCopyWith<$R2, Project, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _ProjectCopyWithImpl($value, $cast, t);
}
