import 'package:dart_mappable/dart_mappable.dart';

part 'tracking_data.mapper.dart';

@MappableClass(
  caseStyle: CaseStyle.snakeCase,
)
class TrackingData with TrackingDataMappable {
  static const defaultValue = TrackingData(
    durationSpentInSec: 0,
    lastStartTimestamp: 0,
    isRunning: false,
  );
  final int durationSpentInSec;
  // in unix timestamp sec
  final int lastStartTimestamp;
  final bool isRunning;

  const TrackingData({
    required this.durationSpentInSec,
    required this.lastStartTimestamp,
    required this.isRunning,
  });

  factory TrackingData.fromJson(String str) => TrackingDataMapper.fromJson(str);
}
