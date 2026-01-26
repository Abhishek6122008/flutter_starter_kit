import 'package:flutter_starter_kit/models/common_kml.dart';

class PyramidKmlModel {
  static KmlPayload generate({
    required double latitude,
    required double longitude,
  }) {
    // Size of pyramid base
    const double size = 0.01;
    const double height = 800;

    // Base square points
    final p1 = '${longitude - size},${latitude - size},0';
    final p2 = '${longitude + size},${latitude - size},0';
    final p3 = '${longitude + size},${latitude + size},0';
    final p4 = '${longitude - size},${latitude + size},0';

    // Apex point
    final apex = '$longitude,$latitude,$height';

    final kml =
        '''
<?xml version="1.0" encoding="UTF-8"?>
<kml xmlns="http://www.opengis.net/kml/2.2">
<Document>

  <name>3D Colored Pyramid</name>

  <Style id="pyramidStyle">
    <PolyStyle>
      <color>66ffcc00</color>
    </PolyStyle>
  </Style>

  <!-- Side 1 -->
  <Placemark>
    <styleUrl>#pyramidStyle</styleUrl>
    <Polygon>
      <extrude>1</extrude>
      <altitudeMode>relativeToGround</altitudeMode>
      <outerBoundaryIs>
        <LinearRing>
          <coordinates>
            $p1
            $p2
            $apex
            $p1
          </coordinates>
        </LinearRing>
      </outerBoundaryIs>
    </Polygon>
  </Placemark>

  <!-- Side 2 -->
  <Placemark>
    <styleUrl>#pyramidStyle</styleUrl>
    <Polygon>
      <extrude>1</extrude>
      <altitudeMode>relativeToGround</altitudeMode>
      <outerBoundaryIs>
        <LinearRing>
          <coordinates>
            $p2
            $p3
            $apex
            $p2
          </coordinates>
        </LinearRing>
      </outerBoundaryIs>
    </Polygon>
  </Placemark>

  <!-- Side 3 -->
  <Placemark>
    <styleUrl>#pyramidStyle</styleUrl>
    <Polygon>
      <extrude>1</extrude>
      <altitudeMode>relativeToGround</altitudeMode>
      <outerBoundaryIs>
        <LinearRing>
          <coordinates>
            $p3
            $p4
            $apex
            $p3
          </coordinates>
        </LinearRing>
      </outerBoundaryIs>
    </Polygon>
  </Placemark>

  <!-- Side 4 -->
  <Placemark>
    <styleUrl>#pyramidStyle</styleUrl>
    <Polygon>
      <extrude>1</extrude>
      <altitudeMode>relativeToGround</altitudeMode>
      <outerBoundaryIs>
        <LinearRing>
          <coordinates>
            $p4
            $p1
            $apex
            $p4
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
      range: 2000,
    );
  }
}
