import '../../kmls/kml_feature.dart';
import '../../kmls/common_kml.dart';
import '../../api/geocoding_api.dart';
import '../../kmls/point_kml_builder.dart';

class GeocodingPointKmlAdapter
    implements
        KmlFeature {
  final String placeName;
  final LatLng location;
  final double range;

  const GeocodingPointKmlAdapter({
    required this.placeName,
    required this.location,
    this.range = 12000,
  });

  /// Backward-compatible static API
  static KmlPayload buildFromLocation({
    required String placeName,
    required LatLng location,
    double range = 12000,
  }) {
    return GeocodingPointKmlAdapter(
      placeName: placeName,
      location: location,
      range: range,
    ).build();
  }

  @override
  KmlPayload build() {
    final placemark = PointKmlBuilder.build(
      name: placeName,
      latitude: location.lat,
      longitude: location.lng,
    );

    final kml =
        '''
<?xml version="1.0" encoding="UTF-8"?>
<kml xmlns="http://www.opengis.net/kml/2.2">
<Document>
  <name>$placeName</name>
  $placemark
</Document>
</kml>
''';

    return KmlPayload(
      kml: kml,
      latitude: location.lat,
      longitude: location.lng,
      range: range,
    );
  }
}
