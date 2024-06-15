// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'completed_task.dart';

class CompletedTaskMapper extends ClassMapperBase<CompletedTask> {
  CompletedTaskMapper._();

  static CompletedTaskMapper? _instance;
  static CompletedTaskMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = CompletedTaskMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'CompletedTask';

  static String _$content(CompletedTask v) => v.content;
  static const Field<CompletedTask, String> _f$content =
      Field('content', _$content);
  static String _$userId(CompletedTask v) => v.userId;
  static const Field<CompletedTask, String> _f$userId =
      Field('userId', _$userId, key: 'user_id');
  static String _$taskId(CompletedTask v) => v.taskId;
  static const Field<CompletedTask, String> _f$taskId =
      Field('taskId', _$taskId, key: 'task_id');
  static String _$projectId(CompletedTask v) => v.projectId;
  static const Field<CompletedTask, String> _f$projectId =
      Field('projectId', _$projectId, key: 'project_id');
  static String _$sectionId(CompletedTask v) => v.sectionId;
  static const Field<CompletedTask, String> _f$sectionId =
      Field('sectionId', _$sectionId, key: 'section_id');
  static DateTime _$completedAt(CompletedTask v) => v.completedAt;
  static const Field<CompletedTask, DateTime> _f$completedAt =
      Field('completedAt', _$completedAt, key: 'completed_at');
  static String _$id(CompletedTask v) => v.id;
  static const Field<CompletedTask, String> _f$id = Field('id', _$id);

  @override
  final MappableFields<CompletedTask> fields = const {
    #content: _f$content,
    #userId: _f$userId,
    #taskId: _f$taskId,
    #projectId: _f$projectId,
    #sectionId: _f$sectionId,
    #completedAt: _f$completedAt,
    #id: _f$id,
  };

  static CompletedTask _instantiate(DecodingData data) {
    return CompletedTask(
        content: data.dec(_f$content),
        userId: data.dec(_f$userId),
        taskId: data.dec(_f$taskId),
        projectId: data.dec(_f$projectId),
        sectionId: data.dec(_f$sectionId),
        completedAt: data.dec(_f$completedAt),
        id: data.dec(_f$id));
  }

  @override
  final Function instantiate = _instantiate;

  static CompletedTask fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<CompletedTask>(map);
  }

  static CompletedTask fromJson(String json) {
    return ensureInitialized().decodeJson<CompletedTask>(json);
  }
}

mixin CompletedTaskMappable {
  String toJson() {
    return CompletedTaskMapper.ensureInitialized()
        .encodeJson<CompletedTask>(this as CompletedTask);
  }

  Map<String, dynamic> toMap() {
    return CompletedTaskMapper.ensureInitialized()
        .encodeMap<CompletedTask>(this as CompletedTask);
  }

  CompletedTaskCopyWith<CompletedTask, CompletedTask, CompletedTask>
      get copyWith => _CompletedTaskCopyWithImpl(
          this as CompletedTask, $identity, $identity);
  @override
  String toString() {
    return CompletedTaskMapper.ensureInitialized()
        .stringifyValue(this as CompletedTask);
  }

  @override
  bool operator ==(Object other) {
    return CompletedTaskMapper.ensureInitialized()
        .equalsValue(this as CompletedTask, other);
  }

  @override
  int get hashCode {
    return CompletedTaskMapper.ensureInitialized()
        .hashValue(this as CompletedTask);
  }
}

extension CompletedTaskValueCopy<$R, $Out>
    on ObjectCopyWith<$R, CompletedTask, $Out> {
  CompletedTaskCopyWith<$R, CompletedTask, $Out> get $asCompletedTask =>
      $base.as((v, t, t2) => _CompletedTaskCopyWithImpl(v, t, t2));
}

abstract class CompletedTaskCopyWith<$R, $In extends CompletedTask, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {String? content,
      String? userId,
      String? taskId,
      String? projectId,
      String? sectionId,
      DateTime? completedAt,
      String? id});
  CompletedTaskCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _CompletedTaskCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, CompletedTask, $Out>
    implements CompletedTaskCopyWith<$R, CompletedTask, $Out> {
  _CompletedTaskCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<CompletedTask> $mapper =
      CompletedTaskMapper.ensureInitialized();
  @override
  $R call(
          {String? content,
          String? userId,
          String? taskId,
          String? projectId,
          String? sectionId,
          DateTime? completedAt,
          String? id}) =>
      $apply(FieldCopyWithData({
        if (content != null) #content: content,
        if (userId != null) #userId: userId,
        if (taskId != null) #taskId: taskId,
        if (projectId != null) #projectId: projectId,
        if (sectionId != null) #sectionId: sectionId,
        if (completedAt != null) #completedAt: completedAt,
        if (id != null) #id: id
      }));
  @override
  CompletedTask $make(CopyWithData data) => CompletedTask(
      content: data.get(#content, or: $value.content),
      userId: data.get(#userId, or: $value.userId),
      taskId: data.get(#taskId, or: $value.taskId),
      projectId: data.get(#projectId, or: $value.projectId),
      sectionId: data.get(#sectionId, or: $value.sectionId),
      completedAt: data.get(#completedAt, or: $value.completedAt),
      id: data.get(#id, or: $value.id));

  @override
  CompletedTaskCopyWith<$R2, CompletedTask, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _CompletedTaskCopyWithImpl($value, $cast, t);
}
