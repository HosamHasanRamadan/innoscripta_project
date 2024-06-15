// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'task.dart';

class TaskMapper extends ClassMapperBase<Task> {
  TaskMapper._();

  static TaskMapper? _instance;
  static TaskMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = TaskMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'Task';

  static int _$commentCount(Task v) => v.commentCount;
  static const Field<Task, int> _f$commentCount =
      Field('commentCount', _$commentCount, key: 'comment_count');
  static bool _$isCompleted(Task v) => v.isCompleted;
  static const Field<Task, bool> _f$isCompleted =
      Field('isCompleted', _$isCompleted, key: 'is_completed');
  static String _$content(Task v) => v.content;
  static const Field<Task, String> _f$content = Field('content', _$content);
  static String? _$description(Task v) => v.description;
  static const Field<Task, String> _f$description =
      Field('description', _$description);
  static String _$id(Task v) => v.id;
  static const Field<Task, String> _f$id = Field('id', _$id);
  static int _$order(Task v) => v.order;
  static const Field<Task, int> _f$order = Field('order', _$order);
  static String _$projectId(Task v) => v.projectId;
  static const Field<Task, String> _f$projectId =
      Field('projectId', _$projectId, key: 'project_id');
  static String _$sectionId(Task v) => v.sectionId;
  static const Field<Task, String> _f$sectionId =
      Field('sectionId', _$sectionId, key: 'section_id');

  @override
  final MappableFields<Task> fields = const {
    #commentCount: _f$commentCount,
    #isCompleted: _f$isCompleted,
    #content: _f$content,
    #description: _f$description,
    #id: _f$id,
    #order: _f$order,
    #projectId: _f$projectId,
    #sectionId: _f$sectionId,
  };

  static Task _instantiate(DecodingData data) {
    return Task(
        commentCount: data.dec(_f$commentCount),
        isCompleted: data.dec(_f$isCompleted),
        content: data.dec(_f$content),
        description: data.dec(_f$description),
        id: data.dec(_f$id),
        order: data.dec(_f$order),
        projectId: data.dec(_f$projectId),
        sectionId: data.dec(_f$sectionId));
  }

  @override
  final Function instantiate = _instantiate;

  static Task fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Task>(map);
  }

  static Task fromJson(String json) {
    return ensureInitialized().decodeJson<Task>(json);
  }
}

mixin TaskMappable {
  String toJson() {
    return TaskMapper.ensureInitialized().encodeJson<Task>(this as Task);
  }

  Map<String, dynamic> toMap() {
    return TaskMapper.ensureInitialized().encodeMap<Task>(this as Task);
  }

  TaskCopyWith<Task, Task, Task> get copyWith =>
      _TaskCopyWithImpl(this as Task, $identity, $identity);
  @override
  String toString() {
    return TaskMapper.ensureInitialized().stringifyValue(this as Task);
  }

  @override
  bool operator ==(Object other) {
    return TaskMapper.ensureInitialized().equalsValue(this as Task, other);
  }

  @override
  int get hashCode {
    return TaskMapper.ensureInitialized().hashValue(this as Task);
  }
}

extension TaskValueCopy<$R, $Out> on ObjectCopyWith<$R, Task, $Out> {
  TaskCopyWith<$R, Task, $Out> get $asTask =>
      $base.as((v, t, t2) => _TaskCopyWithImpl(v, t, t2));
}

abstract class TaskCopyWith<$R, $In extends Task, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {int? commentCount,
      bool? isCompleted,
      String? content,
      String? description,
      String? id,
      int? order,
      String? projectId,
      String? sectionId});
  TaskCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _TaskCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, Task, $Out>
    implements TaskCopyWith<$R, Task, $Out> {
  _TaskCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Task> $mapper = TaskMapper.ensureInitialized();
  @override
  $R call(
          {int? commentCount,
          bool? isCompleted,
          String? content,
          Object? description = $none,
          String? id,
          int? order,
          String? projectId,
          String? sectionId}) =>
      $apply(FieldCopyWithData({
        if (commentCount != null) #commentCount: commentCount,
        if (isCompleted != null) #isCompleted: isCompleted,
        if (content != null) #content: content,
        if (description != $none) #description: description,
        if (id != null) #id: id,
        if (order != null) #order: order,
        if (projectId != null) #projectId: projectId,
        if (sectionId != null) #sectionId: sectionId
      }));
  @override
  Task $make(CopyWithData data) => Task(
      commentCount: data.get(#commentCount, or: $value.commentCount),
      isCompleted: data.get(#isCompleted, or: $value.isCompleted),
      content: data.get(#content, or: $value.content),
      description: data.get(#description, or: $value.description),
      id: data.get(#id, or: $value.id),
      order: data.get(#order, or: $value.order),
      projectId: data.get(#projectId, or: $value.projectId),
      sectionId: data.get(#sectionId, or: $value.sectionId));

  @override
  TaskCopyWith<$R2, Task, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _TaskCopyWithImpl($value, $cast, t);
}
