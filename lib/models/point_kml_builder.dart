class PointKmlBuilder {
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
