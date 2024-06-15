// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'trackable_completed_task.dart';

class TrackableCompletedTaskMapper
    extends ClassMapperBase<TrackableCompletedTask> {
  TrackableCompletedTaskMapper._();

  static TrackableCompletedTaskMapper? _instance;
  static TrackableCompletedTaskMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = TrackableCompletedTaskMapper._());
      CompletedTaskMapper.ensureInitialized();
      TrackingDataMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'TrackableCompletedTask';

  static CompletedTask _$task(TrackableCompletedTask v) => v.task;
  static const Field<TrackableCompletedTask, CompletedTask> _f$task =
      Field('task', _$task);
  static TrackingData _$trackingData(TrackableCompletedTask v) =>
      v.trackingData;
  static const Field<TrackableCompletedTask, TrackingData> _f$trackingData =
      Field('trackingData', _$trackingData,
          key: 'tracking_data', opt: true, def: TrackingData.defaultValue);

  @override
  final MappableFields<TrackableCompletedTask> fields = const {
    #task: _f$task,
    #trackingData: _f$trackingData,
  };

  static TrackableCompletedTask _instantiate(DecodingData data) {
    return TrackableCompletedTask(
        task: data.dec(_f$task), trackingData: data.dec(_f$trackingData));
  }

  @override
  final Function instantiate = _instantiate;

  static TrackableCompletedTask fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<TrackableCompletedTask>(map);
  }

  static TrackableCompletedTask fromJson(String json) {
    return ensureInitialized().decodeJson<TrackableCompletedTask>(json);
  }
}

mixin TrackableCompletedTaskMappable {
  String toJson() {
    return TrackableCompletedTaskMapper.ensureInitialized()
        .encodeJson<TrackableCompletedTask>(this as TrackableCompletedTask);
  }

  Map<String, dynamic> toMap() {
    return TrackableCompletedTaskMapper.ensureInitialized()
        .encodeMap<TrackableCompletedTask>(this as TrackableCompletedTask);
  }

  TrackableCompletedTaskCopyWith<TrackableCompletedTask, TrackableCompletedTask,
          TrackableCompletedTask>
      get copyWith => _TrackableCompletedTaskCopyWithImpl(
          this as TrackableCompletedTask, $identity, $identity);
  @override
  String toString() {
    return TrackableCompletedTaskMapper.ensureInitialized()
        .stringifyValue(this as TrackableCompletedTask);
  }

  @override
  bool operator ==(Object other) {
    return TrackableCompletedTaskMapper.ensureInitialized()
        .equalsValue(this as TrackableCompletedTask, other);
  }

  @override
  int get hashCode {
    return TrackableCompletedTaskMapper.ensureInitialized()
        .hashValue(this as TrackableCompletedTask);
  }
}

extension TrackableCompletedTaskValueCopy<$R, $Out>
    on ObjectCopyWith<$R, TrackableCompletedTask, $Out> {
  TrackableCompletedTaskCopyWith<$R, TrackableCompletedTask, $Out>
      get $asTrackableCompletedTask =>
          $base.as((v, t, t2) => _TrackableCompletedTaskCopyWithImpl(v, t, t2));
}

abstract class TrackableCompletedTaskCopyWith<
    $R,
    $In extends TrackableCompletedTask,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  CompletedTaskCopyWith<$R, CompletedTask, CompletedTask> get task;
  TrackingDataCopyWith<$R, TrackingData, TrackingData> get trackingData;
  $R call({CompletedTask? task, TrackingData? trackingData});
  TrackableCompletedTaskCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _TrackableCompletedTaskCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, TrackableCompletedTask, $Out>
    implements
        TrackableCompletedTaskCopyWith<$R, TrackableCompletedTask, $Out> {
  _TrackableCompletedTaskCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<TrackableCompletedTask> $mapper =
      TrackableCompletedTaskMapper.ensureInitialized();
  @override
  CompletedTaskCopyWith<$R, CompletedTask, CompletedTask> get task =>
      $value.task.copyWith.$chain((v) => call(task: v));
  @override
  TrackingDataCopyWith<$R, TrackingData, TrackingData> get trackingData =>
      $value.trackingData.copyWith.$chain((v) => call(trackingData: v));
  @override
  $R call({CompletedTask? task, TrackingData? trackingData}) =>
      $apply(FieldCopyWithData({
        if (task != null) #task: task,
        if (trackingData != null) #trackingData: trackingData
      }));
  @override
  TrackableCompletedTask $make(CopyWithData data) => TrackableCompletedTask(
      task: data.get(#task, or: $value.task),
      trackingData: data.get(#trackingData, or: $value.trackingData));

  @override
  TrackableCompletedTaskCopyWith<$R2, TrackableCompletedTask, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _TrackableCompletedTaskCopyWithImpl($value, $cast, t);
}
