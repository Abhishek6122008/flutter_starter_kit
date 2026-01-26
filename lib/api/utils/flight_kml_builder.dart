class FlightKmlBuilder {
  static String buildFlightsKml(
    List<
      dynamic
    >
    flights,
  ) {
    final buffer = StringBuffer();

    buffer.writeln(
      '''<?xml version="1.0" encoding="UTF-8"?>
<kml xmlns="http://www.opengis.net/kml/2.2">
<Document>
  <name>Live Flights</name>
''',
    );

    for (final f in flights) {
      // OpenSky format:
      // [icao24, callsign, origin_country, time_position, last_contact,
      //  longitude, latitude, baro_altitude, on_ground, velocity,
      //  heading, vertical_rate, sensors, geo_altitude, squawk, spi, position_source]

      final callsign =
          (f[1] ??
                  "Unknown")
              .toString()
              .trim();
      final lon = f[5];
      final lat = f[6];
      final alt =
          f[13] ??
          10000;

      if (lon ==
              null ||
          lat ==
              null) {
        continue;
      }

      buffer.writeln(
        '''
  <Placemark>
    <name>$callsign</name>
    <Style>
      <IconStyle>
        <scale>1.2</scale>
        <Icon>
          <href>http://maps.google.com/mapfiles/kml/shapes/airports.png</href>
        </Icon>
      </IconStyle>
    </Style>
    <Point>
      <coordinates>$lon,$lat,$alt</coordinates>
    </Point>
  </Placemark>
''',
      );
    }

    buffer.writeln(
      '''
</Document>
</kml>
''',
    );

    return buffer.toString();
  }
}
