import 'dart:convert';
import 'package:http/http.dart' as http;
import 'opensky_auth.dart';
import 'config/opensky_config.dart';

class OpenSkyFlights {
  static Future<
    List<
      dynamic
    >
  >
  getFlights({
    required double lamin,
    required double lamax,
    required double lomin,
    required double lomax,
  }) async {
    final token = await OpenSkyAuth.getToken();

    final url = "${OpenSkyConfig.statesUrl}?lamin=$lamin&lamax=$lamax&lomin=$lomin&lomax=$lomax";

    final response = await http.get(
      Uri.parse(
        url,
      ),
      headers: {
        "Authorization": "Bearer $token",
      },
    );

    if (response.statusCode !=
        200) {
      throw Exception(
        "Failed to fetch flights: ${response.body}",
      );
    }

    final data = jsonDecode(
      response.body,
    );

    // "states" is the list of planes
    return data["states"] ??
        [];
  }
}
