import 'dart:convert';
import 'package:http/http.dart' as http;

class GeminiApi {
  final String apiKey;

  GeminiApi(
    this.apiKey,
  );

  Future<
    String
  >
  generate(
    String prompt,
  ) async {
    final url = Uri.parse(
      'https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash:generateContent?key=$apiKey',
    );

    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(
        {
          "contents": [
            {
              "parts": [
                {
                  "text": prompt,
                },
              ],
            },
          ],
        },
      ),
    );

    if (response.statusCode !=
        200) {
      throw Exception(
        'Gemini API error: ${response.body}',
      );
    }

    final data = jsonDecode(
      response.body,
    );
    return data['candidates'][0]['content']['parts'][0]['text'];
  }
}
