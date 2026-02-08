// SKELETON: Pyramid-shaped polygon KML builder for the LG agentic Flutter starter kit.
//
// This model generates a simple 3D-like polygon structure that can be used
// as a visual demo object in Liquid Galaxy.

import 'kml_feature.dart';
import 'common_kml.dart';

class PyramidKmlModel
    implements
        KmlFeature {
  final double latitude;
  final double longitude;

  const PyramidKmlModel({
    required this.latitude,
    required this.longitude,
  });

  /// Backward-compatible static API.
  ///
  /// SKELETON RULES:
  /// - The returned KML must be a fragment (no <kml> root element).
  /// - Geometry and styling strategies may be replaced by agent workflows.
  static KmlPayload generate({
    required double latitude,
    required double longitude,
  }) {
    return PyramidKmlModel(
      latitude: latitude,
      longitude: longitude,
    ).build();
  }

  @override
  KmlPayload build() {
    final lon = longitude;
    final lat = latitude;

    final kml =
        '''
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
