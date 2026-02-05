import 'common_kml.dart';

class PyramidKmlModel {
  static KmlPayload generate({
    required double latitude,
    required double longitude,
  }) {
    final lon = longitude;
    final lat = latitude;

    final kml =
        '''
<Placemark>
  <name>Pyramid</name>
  <Style>
    <PolyStyle>
      <color>66ffcc00</color> <!-- transparent gold -->
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
