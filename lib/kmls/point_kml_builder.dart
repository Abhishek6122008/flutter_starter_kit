// SKELETON: KML point builder for the LG agentic Flutter starter kit.
//
// This builder is used by agent workflows to generate KML fragments.
// Agents may extend this file to support styling, icons and metadata,
// but the public API must remain stable.

class PointKmlBuilder {
  /// Builds a KML <Placemark> element containing a single point.
  ///
  /// SKELETON RULES:
  /// - This method must return a valid KML fragment.
  /// - It must NOT include the <kml> root element.
  /// - Styling and extended data must be added by agent workflows.
  static String build({
    required String name,
    required double latitude,
    required double longitude,
  }) {
    return '''
<Placemark>
  <name>$name</name>
  <Point>
    <coordinates>$longitude,$latitude,0</coordinates>
  </Point>
</Placemark>
''';
  }
}
