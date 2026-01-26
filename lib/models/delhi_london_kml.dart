import 'common_kml.dart';

class DelhiLondonKmlModel {
  static KmlPayload generate() {
    const double delLat = 28.5562;
    const double delLon = 77.1000;

    const double lonLat = 51.4700;
    const double lonLon = -0.4543;

    final kml =
        '''
<?xml version="1.0" encoding="UTF-8"?>
<kml xmlns="http://www.opengis.net/kml/2.2">
<Document>
  <name>Delhi to London Route</name>

  <!-- Transparent Pyramid Style -->
  <Style id="pyramidStyle">
    <PolyStyle>
      <color>66ffcc00</color>
    </PolyStyle>
  </Style>

  <!-- Delhi Airport Marker -->
  <Placemark>
    <name>Delhi Airport</name>
    <Point>
      <coordinates>$delLon,$delLat,0</coordinates>
    </Point>
  </Placemark>

  <!-- London Airport Marker -->
  <Placemark>
    <name>London Heathrow</name>
    <Point>
      <coordinates>$lonLon,$lonLat,0</coordinates>
    </Point>
  </Placemark>

  <!-- Route Line -->
  <Placemark>
    <name>Delhi to London Route</name>
    <LineString>
      <tessellate>1</tessellate>
      <coordinates>
        $delLon,$delLat,0
        $lonLon,$lonLat,0
      </coordinates>
    </LineString>
  </Placemark>

  <!-- Pyramid at Delhi -->
  <Placemark>
    <name>Delhi Pyramid</name>
    <styleUrl>#pyramidStyle</styleUrl>
    <Polygon>
      <outerBoundaryIs>
        <LinearRing>
          <coordinates>
            ${delLon - 0.01},${delLat - 0.01},0
            ${delLon + 0.01},${delLat - 0.01},0
            ${delLon},${delLat + 0.02},3000
            ${delLon - 0.01},${delLat - 0.01},0
          </coordinates>
        </LinearRing>
      </outerBoundaryIs>
    </Polygon>
  </Placemark>

  <!-- Pyramid at London -->
  <Placemark>
    <name>London Pyramid</name>
    <styleUrl>#pyramidStyle</styleUrl>
    <Polygon>
      <outerBoundaryIs>
        <LinearRing>
          <coordinates>
            ${lonLon - 0.01},${lonLat - 0.01},0
            ${lonLon + 0.01},${lonLat - 0.01},0
            ${lonLon},${lonLat + 0.02},3000
            ${lonLon - 0.01},${lonLat - 0.01},0
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
      latitude: delLat,
      longitude: delLon,
      range: 8000000,
    );
  }
}
