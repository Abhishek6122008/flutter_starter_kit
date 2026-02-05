class RouteKmlBuilder {
  static String build({
    required double fromLat,
    required double fromLon,
    required double toLat,
    required double toLon,
    required String name,
  }) {
    return '''
<Placemark>
  <name>$name</name>
  <Style>
    <LineStyle>
      <color>ff0000ff</color> <!-- red line -->
      <width>4</width>
    </LineStyle>
  </Style>
  <LineString>
    <tessellate>1</tessellate>
    <coordinates>
      $fromLon,$fromLat,0
      $toLon,$toLat,0
    </coordinates>
  </LineString>
</Placemark>
''';
  }
}
