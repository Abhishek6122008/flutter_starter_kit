// SKELETON: Time-based KML builder (TimeStamp / TimeSpan)
// for the LG agentic Flutter starter kit.
//
// This builder generates a complete KML document containing
// one or more placemarks with temporal information.
//
// Agents may extend this builder to support dynamic styling
// and advanced metadata.

import 'kml_feature.dart';
import 'common_kml.dart';

class TimeBasedKmlBuilder
    implements
        KmlFeature {
  final String name;
  final List<
    TimePlacemark
  >
  placemarks;
  final double range;

  const TimeBasedKmlBuilder({
    required this.name,
    required this.placemarks,
    this.range = 12000,
  });

  /// Backward-compatible static API
  static KmlPayload buildDocument({
    required String name,
    required List<
      TimePlacemark
    >
    placemarks,
    double range = 12000,
  }) {
    return TimeBasedKmlBuilder(
      name: name,
      placemarks: placemarks,
      range: range,
    ).build();
  }

  @override
  KmlPayload build() {
    final placemarkBlocks = placemarks.map(
      (
        p,
      ) {
        final timeBlock =
            p.endTime ==
                null
            ? '''
<TimeStamp>
  <when>${p.beginTime}</when>
</TimeStamp>
'''
            : '''
<TimeSpan>
  <begin>${p.beginTime}</begin>
  <end>${p.endTime}</end>
</TimeSpan>
''';

        return '''
<Placemark>
  <name>${p.name}</name>
  $timeBlock
  <Point>
    <coordinates>${p.longitude},${p.latitude},0</coordinates>
  </Point>
</Placemark>
''';
      },
    ).join();

    final kml =
        '''
<?xml version="1.0" encoding="UTF-8"?>
<kml xmlns="http://www.opengis.net/kml/2.2">
<Document>
  <name>$name</name>

  $placemarkBlocks

</Document>
</kml>
''';

    final first = placemarks.isNotEmpty
        ? placemarks.first
        : const TimePlacemark(
            name: '',
            latitude: 0,
            longitude: 0,
            beginTime: '',
          );

    return KmlPayload(
      kml: kml,
      latitude: first.latitude,
      longitude: first.longitude,
      range: range,
    );
  }
}

/// Immutable time-aware placemark model.
/// Agents may extend this with styling and metadata later.
class TimePlacemark {
  final String name;
  final double latitude;
  final double longitude;

  /// ISO-8601 formatted time (e.g. 2026-02-18T10:30:00Z)
  final String beginTime;

  /// Optional end time for TimeSpan
  final String? endTime;

  const TimePlacemark({
    required this.name,
    required this.latitude,
    required this.longitude,
    required this.beginTime,
    this.endTime,
  });
}
