// SKELETON: Route / line KML builder for the LG agentic Flutter starter kit.
//
// This builder generates a simple LineString placemark between two points.
// Agent workflows may extend this builder to support multi-point routes,
// dynamic styling and metadata.

class RouteKmlBuilder {
  /// Builds a KML <Placemark> representing a route between two points.
  ///
  /// SKELETON RULES:
  /// - This method returns a KML fragment only (no <kml> root element).
  /// - Styling may be replaced or extended by agent workflows.
  static String build({
    required double fromLat,
    required double fromLon,
    required double toLat,
    required double toLon,
    required String name,
  }) {
    // SKELETON BASE IMPLEMENTATION
    return '''
<Placemark>
  <name>$name</name>
  <Style>
    <LineStyle>
      <color>ff0000ff</color>
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
