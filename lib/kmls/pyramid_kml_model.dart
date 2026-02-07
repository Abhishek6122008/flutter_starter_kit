// SKELETON: Pyramid-shaped polygon KML builder for the LG agentic Flutter starter kit.
//
// This model generates a simple 3D-like polygon structure that can be used
// as a visual demo object in Liquid Galaxy.

import 'common_kml.dart';

class PyramidKmlModel {
  /// Generates a simple pyramid-like polygon and wraps it in a KmlPayload.
  ///
  /// SKELETON RULES:
  /// - The returned KML must be a fragment (no <kml> root element).
  /// - Geometry and styling strategies may be replaced by agent workflows.
  static KmlPayload generate({
    required double latitude,
    required double longitude,
  }) {
    final lon = longitude;
    final lat = latitude;

    final kml = '''
<Placemark>
  <name>Pyramid</name>
  <Style>
    <PolyStyle>
      <color>66ffcc00</color>
    </PolyStyle>
  </Style>
  <Polygon>
    <outerBoundaryIs>
      <LinearRing>
        <coordinates>
          ${lon - 0.01},${lat - 0.01},0
          ${lon + 0.01},${lat - 0.01},0
          $lon,${lat + 0.02},3000
          ${lon - 0.01},${lat - 0.01},0
        </coordinates>
      </LinearRing>
    </outerBoundaryIs>
  </Polygon>
</Placemark>
''';

    return KmlPayload(
      kml: kml,
      latitude: latitude,
      longitude: longitude,
      range: 30000,
    );
  }
}
