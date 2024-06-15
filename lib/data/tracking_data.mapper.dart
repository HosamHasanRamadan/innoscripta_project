// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'tracking_data.dart';

class TrackingDataMapper extends ClassMapperBase<TrackingData> {
  TrackingDataMapper._();

  static TrackingDataMapper? _instance;
  static TrackingDataMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = TrackingDataMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'TrackingData';

  static int _$durationSpentInSec(TrackingData v) => v.durationSpentInSec;
  static const Field<TrackingData, int> _f$durationSpentInSec = Field(
      'durationSpentInSec', _$durationSpentInSec,
      key: 'duration_spent_in_sec');
  static int _$lastStartTimestamp(TrackingData v) => v.lastStartTimestamp;
  static const Field<TrackingData, int> _f$lastStartTimestamp = Field(
      'lastStartTimestamp', _$lastStartTimestamp,
      key: 'last_start_timestamp');
  static bool _$isRunning(TrackingData v) => v.isRunning;
  static const Field<TrackingData, bool> _f$isRunning =
      Field('isRunning', _$isRunning, key: 'is_running');

  @override
  final MappableFields<TrackingData> fields = const {
    #durationSpentInSec: _f$durationSpentInSec,
    #lastStartTimestamp: _f$lastStartTimestamp,
    #isRunning: _f$isRunning,
  };

  static TrackingData _instantiate(DecodingData data) {
    return TrackingData(
        durationSpentInSec: data.dec(_f$durationSpentInSec),
        lastStartTimestamp: data.dec(_f$lastStartTimestamp),
        isRunning: data.dec(_f$isRunning));
  }

  @override
  final Function instantiate = _instantiate;

  static TrackingData fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<TrackingData>(map);
  }

  static TrackingData fromJson(String json) {
    return ensureInitialized().decodeJson<TrackingData>(json);
  }
}

mixin TrackingDataMappable {
  String toJson() {
    return TrackingDataMapper.ensureInitialized()
        .encodeJson<TrackingData>(this as TrackingData);
  }

  Map<String, dynamic> toMap() {
    return TrackingDataMapper.ensureInitialized()
        .encodeMap<TrackingData>(this as TrackingData);
  }

  TrackingDataCopyWith<TrackingData, TrackingData, TrackingData> get copyWith =>
      _TrackingDataCopyWithImpl(this as TrackingData, $identity, $identity);
  @override
  String toString() {
    return TrackingDataMapper.ensureInitialized()
        .stringifyValue(this as TrackingData);
  }

  @override
  bool operator ==(Object other) {
    return TrackingDataMapper.ensureInitialized()
        .equalsValue(this as TrackingData, other);
  }

  @override
  int get hashCode {
    return TrackingDataMapper.ensureInitialized()
        .hashValue(this as TrackingData);
  }
}

extension TrackingDataValueCopy<$R, $Out>
    on ObjectCopyWith<$R, TrackingData, $Out> {
  TrackingDataCopyWith<$R, TrackingData, $Out> get $asTrackingData =>
      $base.as((v, t, t2) => _TrackingDataCopyWithImpl(v, t, t2));
}

abstract class TrackingDataCopyWith<$R, $In extends TrackingData, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({int? durationSpentInSec, int? lastStartTimestamp, bool? isRunning});
  TrackingDataCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _TrackingDataCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, TrackingData, $Out>
    implements TrackingDataCopyWith<$R, TrackingData, $Out> {
  _TrackingDataCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<TrackingData> $mapper =
      TrackingDataMapper.ensureInitialized();
  @override
  $R call(
          {int? durationSpentInSec,
          int? lastStartTimestamp,
          bool? isRunning}) =>
      $apply(FieldCopyWithData({
        if (durationSpentInSec != null) #durationSpentInSec: durationSpentInSec,
        if (lastStartTimestamp != null) #lastStartTimestamp: lastStartTimestamp,
        if (isRunning != null) #isRunning: isRunning
      }));
  @override
  TrackingData $make(CopyWithData data) => TrackingData(
      durationSpentInSec:
          data.get(#durationSpentInSec, or: $value.durationSpentInSec),
      lastStartTimestamp:
          data.get(#lastStartTimestamp, or: $value.lastStartTimestamp),
      isRunning: data.get(#isRunning, or: $value.isRunning));

  @override
  TrackingDataCopyWith<$R2, TrackingData, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _TrackingDataCopyWithImpl($value, $cast, t);
}
