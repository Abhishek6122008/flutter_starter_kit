import 'dart:convert';
import 'package:http/http.dart' as http;

class LatLng {
  final double lat;
  final double lng;

  LatLng(
    this.lat,
    this.lng,
  );
}

abstract class GeocodingApi {
  Future<
    LatLng
  >
  getCoordinates(
    String place,
  );
}

class OpenCageGeocodingApi
    implements
        GeocodingApi {
  final String apiKey;

  OpenCageGeocodingApi(
    this.apiKey,
  );

  @override
  Future<
    LatLng
  >
  getCoordinates(
    String place,
  ) async {
    final uri = Uri.parse(
      'https://api.opencagedata.com/geocode/v1/json'
      '?q=${Uri.encodeComponent(place)}'
      '&key=$apiKey',
    );

    final response = await http.get(
      uri,
    );

    if (response.statusCode !=
        200) {
      throw Exception(
        'OpenCage API error',
      );
    }

    final data = jsonDecode(
      response.body,
    );

    if (data['results'] ==
            null ||
        data['results'].isEmpty) {
      throw Exception(
        'No results found',
      );
    }

    final geometry = data['results'][0]['geometry'];

    return LatLng(
      geometry['lat'],
      geometry['lng'],
    );
  }
}
