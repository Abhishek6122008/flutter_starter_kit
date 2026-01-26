import 'dart:convert';
import 'package:http/http.dart' as http;
import 'config/opensky_config.dart';

class OpenSkyAuth {
  static String? _token;
  static DateTime? _expiry;

  static Future<
    String
  >
  getToken() async {
    // If token still valid, reuse
    if (_token !=
            null &&
        _expiry !=
            null &&
        DateTime.now().isBefore(
          _expiry!,
        )) {
      return _token!;
    }

    final response = await http.post(
      Uri.parse(
        OpenSkyConfig.tokenUrl,
      ),
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
      },
      body: {
        "grant_type": "client_credentials",
        "client_id": OpenSkyConfig.clientId,
        "client_secret": OpenSkyConfig.clientSecret,
      },
    );

    if (response.statusCode !=
        200) {
      throw Exception(
        "Failed to get OpenSky token: ${response.body}",
      );
    }

    final data = jsonDecode(
      response.body,
    );

    _token = data["access_token"];
    final expiresIn = data["expires_in"]; // seconds

    _expiry = DateTime.now().add(
      Duration(
        seconds:
            expiresIn -
            60,
      ),
    );

    return _token!;
  }
}
