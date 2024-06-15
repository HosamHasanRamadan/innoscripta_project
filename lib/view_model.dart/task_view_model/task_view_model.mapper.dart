// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'task_view_model.dart';

class TaskWithCommentsMapper extends ClassMapperBase<TaskWithComments> {
  TaskWithCommentsMapper._();

  static TaskWithCommentsMapper? _instance;
  static TaskWithCommentsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = TaskWithCommentsMapper._());
      TrackableTaskMapper.ensureInitialized();
      CommentMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'TaskWithComments';

  static TrackableTask _$trackableTask(TaskWithComments v) => v.trackableTask;
  static const Field<TaskWithComments, TrackableTask> _f$trackableTask =
      Field('trackableTask', _$trackableTask);
  static List<Comment> _$comments(TaskWithComments v) => v.comments;
  static const Field<TaskWithComments, List<Comment>> _f$comments =
      Field('comments', _$comments);

  @override
  final MappableFields<TaskWithComments> fields = const {
    #trackableTask: _f$trackableTask,
    #comments: _f$comments,
  };

  static TaskWithComments _instantiate(DecodingData data) {
    return TaskWithComments(
        trackableTask: data.dec(_f$trackableTask),
        comments: data.dec(_f$comments));
  }

  @override
  final Function instantiate = _instantiate;
}

mixin TaskWithCommentsMappable {
  TaskWithCommentsCopyWith<TaskWithComments, TaskWithComments, TaskWithComments>
      get copyWith => _TaskWithCommentsCopyWithImpl(
          this as TaskWithComments, $identity, $identity);
}

extension TaskWithCommentsValueCopy<$R, $Out>
    on ObjectCopyWith<$R, TaskWithComments, $Out> {
  TaskWithCommentsCopyWith<$R, TaskWithComments, $Out>
      get $asTaskWithComments =>
          $base.as((v, t, t2) => _TaskWithCommentsCopyWithImpl(v, t, t2));
}

abstract class TaskWithCommentsCopyWith<$R, $In extends TaskWithComments, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  TrackableTaskCopyWith<$R, TrackableTask, TrackableTask> get trackableTask;
  ListCopyWith<$R, Comment, CommentCopyWith<$R, Comment, Comment>> get comments;
  $R call({TrackableTask? trackableTask, List<Comment>? comments});
  TaskWithCommentsCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _TaskWithCommentsCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, TaskWithComments, $Out>
    implements TaskWithCommentsCopyWith<$R, TaskWithComments, $Out> {
  _TaskWithCommentsCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<TaskWithComments> $mapper =
      TaskWithCommentsMapper.ensureInitialized();
  @override
  TrackableTaskCopyWith<$R, TrackableTask, TrackableTask> get trackableTask =>
      $value.trackableTask.copyWith.$chain((v) => call(trackableTask: v));
  @override
  ListCopyWith<$R, Comment, CommentCopyWith<$R, Comment, Comment>>
      get comments => ListCopyWith($value.comments,
          (v, t) => v.copyWith.$chain(t), (v) => call(comments: v));
  @override
  $R call({TrackableTask? trackableTask, List<Comment>? comments}) =>
      $apply(FieldCopyWithData({
        if (trackableTask != null) #trackableTask: trackableTask,
        if (comments != null) #comments: comments
      }));
  @override
  TaskWithComments $make(CopyWithData data) => TaskWithComments(
      trackableTask: data.get(#trackableTask, or: $value.trackableTask),
      comments: data.get(#comments, or: $value.comments));

  @override
  TaskWithCommentsCopyWith<$R2, TaskWithComments, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _TaskWithCommentsCopyWithImpl($value, $cast, t);
}
