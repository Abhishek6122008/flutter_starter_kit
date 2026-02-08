// SKELETON: Polygon KML builder for the LG agentic Flutter starter kit.
//
// This builder provides a simple geometric example (triangle polygon).
// Agent workflows may extend this builder to support arbitrary shapes,
// styles and advanced metadata.

import 'kml_feature.dart';
import 'common_kml.dart';

class PolygonKmlBuilder
    implements
        KmlFeature {
  final String name;
  final double latitude;
  final double longitude;
  final double size;
  final double height;
  final String color;
  final double range;

  const PolygonKmlBuilder({
    required this.name,
    required this.latitude,
    required this.longitude,
    this.size = 0.01,
    this.height = 3000,
    this.color = "66ffcc00",
    this.range = 100000,
  });

  /// Backward-compatible static API.
  static KmlPayload buildTriangle({
    required String name,
    required double latitude,
    required double longitude,
    double size = 0.01,
    double height = 3000,
    String color = "66ffcc00",
    double range = 100000,
  }) {
    return PolygonKmlBuilder(
      name: name,
      latitude: latitude,
      longitude: longitude,
      size: size,
      height: height,
      color: color,
      range: range,
    ).build();
  }

  @override
  KmlPayload build() {
    final kml =
        '''
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
