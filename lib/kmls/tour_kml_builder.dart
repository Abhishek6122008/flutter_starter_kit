// SKELETON: Animated camera tour (gx:Tour) KML builder
// for the LG agentic Flutter starter kit.
//
// This builder generates a complete KML document containing
// a gx:Tour with multiple FlyTo steps.
//
// Agents may extend this builder to support easing modes,
// durations, headings, tilts and dynamic generation.

import 'kml_feature.dart';
import 'common_kml.dart';

class TourKmlBuilder
    implements
        KmlFeature {
  final String name;
  final List<
    TourStop
  >
  stops;
  final double range;

  const TourKmlBuilder({
    required this.name,
    required this.stops,
    this.range = 8000,
  });

  /// Backward-compatible static API
  static KmlPayload buildTour({
    required String name,
    required List<
      TourStop
    >
    stops,
    double range = 8000,
  }) {
    return TourKmlBuilder(
      name: name,
      stops: stops,
      range: range,
    ).build();
  }

  @override
  KmlPayload build() {
    final flyToBlocks = stops.map(
      (
        s,
      ) {
        return '''
<gx:FlyTo>
  <gx:duration>${s.duration}</gx:duration>
  <gx:flyToMode>smooth</gx:flyToMode>
  <LookAt>
    <longitude>${s.longitude}</longitude>
    <latitude>${s.latitude}</latitude>
    <altitude>0</altitude>
    <heading>0</heading>
    <tilt>60</tilt>
    <range>${s.range}</range>
    <altitudeMode>relativeToGround</altitudeMode>
  </LookAt>
</gx:FlyTo>
''';
      },
    ).join();

    final kml =
        '''
<?xml version="1.0" encoding="UTF-8"?>
<kml xmlns="http://www.opengis.net/kml/2.2"
     xmlns:gx="http://www.google.com/kml/ext/2.2">
<Document>
  <name>$name</name>

  <gx:Tour>
    <name>$name tour</name>
    <gx:Playlist>
      $flyToBlocks
    </gx:Playlist>
  </gx:Tour>

</Document>
</kml>
''';

    final first = stops.isNotEmpty
        ? stops.first
        : const TourStop(
            latitude: 0,
            longitude: 0,
          );

    return KmlPayload(
      kml: kml,
      latitude: first.latitude,
      longitude: first.longitude,
      range: range,
    );
  }
}

/// Simple immutable tour stop model.
/// Agents may extend this with heading / tilt / altitude later.
class TourStop {
  final double latitude;
  final double longitude;
  final double range;
  final double duration;

  const TourStop({
    required this.latitude,
    required this.longitude,
    this.range = 8000,
    this.duration = 4.0,
  });
}
