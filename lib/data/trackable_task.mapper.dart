// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'trackable_task.dart';

class TrackableTaskMapper extends ClassMapperBase<TrackableTask> {
  TrackableTaskMapper._();

  static TrackableTaskMapper? _instance;
  static TrackableTaskMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = TrackableTaskMapper._());
      TaskMapper.ensureInitialized();
      TrackingDataMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'TrackableTask';

  static Task _$task(TrackableTask v) => v.task;
  static const Field<TrackableTask, Task> _f$task = Field('task', _$task);
  static TrackingData _$trackingData(TrackableTask v) => v.trackingData;
  static const Field<TrackableTask, TrackingData> _f$trackingData = Field(
      'trackingData', _$trackingData,
      key: 'tracking_data', opt: true, def: TrackingData.defaultValue);

  @override
  final MappableFields<TrackableTask> fields = const {
    #task: _f$task,
    #trackingData: _f$trackingData,
  };

  static TrackableTask _instantiate(DecodingData data) {
    return TrackableTask(
        task: data.dec(_f$task), trackingData: data.dec(_f$trackingData));
  }

  @override
  final Function instantiate = _instantiate;

  static TrackableTask fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<TrackableTask>(map);
  }

  static TrackableTask fromJson(String json) {
    return ensureInitialized().decodeJson<TrackableTask>(json);
  }
}

mixin TrackableTaskMappable {
  String toJson() {
    return TrackableTaskMapper.ensureInitialized()
        .encodeJson<TrackableTask>(this as TrackableTask);
  }

  Map<String, dynamic> toMap() {
    return TrackableTaskMapper.ensureInitialized()
        .encodeMap<TrackableTask>(this as TrackableTask);
  }

  TrackableTaskCopyWith<TrackableTask, TrackableTask, TrackableTask>
      get copyWith => _TrackableTaskCopyWithImpl(
          this as TrackableTask, $identity, $identity);
  @override
  String toString() {
    return TrackableTaskMapper.ensureInitialized()
        .stringifyValue(this as TrackableTask);
  }

  @override
  bool operator ==(Object other) {
    return TrackableTaskMapper.ensureInitialized()
        .equalsValue(this as TrackableTask, other);
  }

  @override
  int get hashCode {
    return TrackableTaskMapper.ensureInitialized()
        .hashValue(this as TrackableTask);
  }
}

extension TrackableTaskValueCopy<$R, $Out>
    on ObjectCopyWith<$R, TrackableTask, $Out> {
  TrackableTaskCopyWith<$R, TrackableTask, $Out> get $asTrackableTask =>
      $base.as((v, t, t2) => _TrackableTaskCopyWithImpl(v, t, t2));
}

abstract class TrackableTaskCopyWith<$R, $In extends TrackableTask, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  TaskCopyWith<$R, Task, Task> get task;
  TrackingDataCopyWith<$R, TrackingData, TrackingData> get trackingData;
  $R call({Task? task, TrackingData? trackingData});
  TrackableTaskCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _TrackableTaskCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, TrackableTask, $Out>
    implements TrackableTaskCopyWith<$R, TrackableTask, $Out> {
  _TrackableTaskCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<TrackableTask> $mapper =
      TrackableTaskMapper.ensureInitialized();
  @override
  TaskCopyWith<$R, Task, Task> get task =>
      $value.task.copyWith.$chain((v) => call(task: v));
  @override
  TrackingDataCopyWith<$R, TrackingData, TrackingData> get trackingData =>
      $value.trackingData.copyWith.$chain((v) => call(trackingData: v));
  @override
  $R call({Task? task, TrackingData? trackingData}) =>
      $apply(FieldCopyWithData({
        if (task != null) #task: task,
        if (trackingData != null) #trackingData: trackingData
      }));
  @override
  TrackableTask $make(CopyWithData data) => TrackableTask(
      task: data.get(#task, or: $value.task),
      trackingData: data.get(#trackingData, or: $value.trackingData));

  @override
  TrackableTaskCopyWith<$R2, TrackableTask, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _TrackableTaskCopyWithImpl($value, $cast, t);
}
