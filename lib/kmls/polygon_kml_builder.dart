// SKELETON: Polygon KML builder for the LG agentic Flutter starter kit.
//
// This builder provides a simple geometric example (triangle polygon).
// Agent workflows may extend this builder to support arbitrary shapes,
// styles and advanced metadata.

import 'common_kml.dart';

class PolygonKmlBuilder {
  /// Builds a triangular polygon and wraps it into a KmlPayload.
  ///
  /// SKELETON RULES:
  /// - Returned KML must be a complete document (<kml> root).
  /// - Geometry generation strategies may be replaced by agents.
  /// - Styling must remain optional and extensible.
  static KmlPayload buildTriangle({
    required String name,
    required double latitude,
    required double longitude,
    double size = 0.01,
    double height = 3000,
    String color = "66ffcc00",
    double range = 100000,
  }) {
    final kml = '''
<?xml version="1.0" encoding="UTF-8"?>
<kml xmlns="http://www.opengis.net/kml/2.2">
<Document>
  <name>$name</name>

  <Style id="polyStyle">
    <PolyStyle>
      <color>$color</color>
    </PolyStyle>
  </Style>

  <Placemark>
    <name>$name</name>
    <styleUrl>#polyStyle</styleUrl>
    <Polygon>
      <outerBoundaryIs>
        <LinearRing>
          <coordinates>
            ${longitude - size},${latitude - size},0
            ${longitude + size},${latitude - size},0
            $longitude,${latitude + size},$height
            ${longitude - size},${latitude - size},0
          </coordinates>
        </LinearRing>
      </outerBoundaryIs>
    </Polygon>
  </Placemark>

</Document>
</kml>
''';

    return KmlPayload(
      kml: kml,
      latitude: latitude,
      longitude: longitude,
      range: range,
    );
  }
}
