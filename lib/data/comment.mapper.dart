// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'comment.dart';

class CommentMapper extends ClassMapperBase<Comment> {
  CommentMapper._();

  static CommentMapper? _instance;
  static CommentMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = CommentMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'Comment';

  static String _$content(Comment v) => v.content;
  static const Field<Comment, String> _f$content = Field('content', _$content);
  static String _$id(Comment v) => v.id;
  static const Field<Comment, String> _f$id = Field('id', _$id);
  static DateTime _$postedAt(Comment v) => v.postedAt;
  static const Field<Comment, DateTime> _f$postedAt =
      Field('postedAt', _$postedAt, key: 'posted_at');
  static String? _$projectId(Comment v) => v.projectId;
  static const Field<Comment, String> _f$projectId =
      Field('projectId', _$projectId, key: 'project_id');
  static String _$taskId(Comment v) => v.taskId;
  static const Field<Comment, String> _f$taskId =
      Field('taskId', _$taskId, key: 'task_id');

  @override
  final MappableFields<Comment> fields = const {
    #content: _f$content,
    #id: _f$id,
    #postedAt: _f$postedAt,
    #projectId: _f$projectId,
    #taskId: _f$taskId,
  };

  static Comment _instantiate(DecodingData data) {
    return Comment(
        content: data.dec(_f$content),
        id: data.dec(_f$id),
        postedAt: data.dec(_f$postedAt),
        projectId: data.dec(_f$projectId),
        taskId: data.dec(_f$taskId));
  }

  @override
  final Function instantiate = _instantiate;

  static Comment fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Comment>(map);
  }

  static Comment fromJson(String json) {
    return ensureInitialized().decodeJson<Comment>(json);
  }
}

mixin CommentMappable {
  String toJson() {
    return CommentMapper.ensureInitialized()
        .encodeJson<Comment>(this as Comment);
  }

  Map<String, dynamic> toMap() {
    return CommentMapper.ensureInitialized()
        .encodeMap<Comment>(this as Comment);
  }

  CommentCopyWith<Comment, Comment, Comment> get copyWith =>
      _CommentCopyWithImpl(this as Comment, $identity, $identity);
  @override
  String toString() {
    return CommentMapper.ensureInitialized().stringifyValue(this as Comment);
  }

  @override
  bool operator ==(Object other) {
    return CommentMapper.ensureInitialized()
        .equalsValue(this as Comment, other);
  }

  @override
  int get hashCode {
    return CommentMapper.ensureInitialized().hashValue(this as Comment);
  }
}

extension CommentValueCopy<$R, $Out> on ObjectCopyWith<$R, Comment, $Out> {
  CommentCopyWith<$R, Comment, $Out> get $asComment =>
      $base.as((v, t, t2) => _CommentCopyWithImpl(v, t, t2));
}

abstract class CommentCopyWith<$R, $In extends Comment, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {String? content,
      String? id,
      DateTime? postedAt,
      String? projectId,
      String? taskId});
  CommentCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _CommentCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, Comment, $Out>
    implements CommentCopyWith<$R, Comment, $Out> {
  _CommentCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Comment> $mapper =
      CommentMapper.ensureInitialized();
  @override
  $R call(
          {String? content,
          String? id,
          DateTime? postedAt,
          Object? projectId = $none,
          String? taskId}) =>
      $apply(FieldCopyWithData({
        if (content != null) #content: content,
        if (id != null) #id: id,
        if (postedAt != null) #postedAt: postedAt,
        if (projectId != $none) #projectId: projectId,
        if (taskId != null) #taskId: taskId
      }));
  @override
  Comment $make(CopyWithData data) => Comment(
      content: data.get(#content, or: $value.content),
      id: data.get(#id, or: $value.id),
      postedAt: data.get(#postedAt, or: $value.postedAt),
      projectId: data.get(#projectId, or: $value.projectId),
      taskId: data.get(#taskId, or: $value.taskId));

  @override
  CommentCopyWith<$R2, Comment, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _CommentCopyWithImpl($value, $cast, t);
}
