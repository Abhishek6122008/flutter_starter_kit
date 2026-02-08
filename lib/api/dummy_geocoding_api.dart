import 'geocoding_api.dart';

class DummyGeocodingApi
    implements
        GeocodingApi {
  @override
  Future<
    LatLng
  >
  getCoordinates(
    String place,
  ) async {
    // Dummy fixed location (Eiffel Tower)
    return const LatLng(
      48.8584,
      2.2945,
    );
  }
}
