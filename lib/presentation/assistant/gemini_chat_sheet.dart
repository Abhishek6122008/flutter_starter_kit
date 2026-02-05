import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:flutter_tts/flutter_tts.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../api/gemini_api.dart';

class GeminiChatSheet
    extends
        StatefulWidget {
  const GeminiChatSheet({
    super.key,
  });

  @override
  State<
    GeminiChatSheet
  >
  createState() => _GeminiChatSheetState();
}

class _GeminiChatSheetState
    extends
        State<
          GeminiChatSheet
        > {
  final TextEditingController controller = TextEditingController();

  final stt.SpeechToText _speech = stt.SpeechToText();
  final FlutterTts _tts = FlutterTts();

  bool listening = false;
  bool loading = false;

  String? response;

  late final GeminiApi api;

  @override
  void initState() {
    super.initState();

    api = GeminiApi(
      dotenv.env['GEMINI_API_KEY']!,
    );

    _tts.setLanguage(
      "en-US",
    );
    _tts.setSpeechRate(
      0.45,
    );
  }

  @override
  void dispose() {
    controller.dispose();
    _speech.stop();
    _tts.stop();
    super.dispose();
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(
          context,
        ).viewInsets.bottom,
        left: 16,
        right: 16,
        top: 16,
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "Gemini Voice Assistant",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(
              height: 12,
            ),

            TextField(
              controller: controller,
              maxLines: 3,
              decoration: const InputDecoration(
                hintText: "Speak or type your question…",
              ),
            ),

            const SizedBox(
              height: 12,
            ),

            Row(
              children: [
                IconButton(
                  icon: Icon(
                    listening
                        ? Icons.mic
                        : Icons.mic_none,
                    color: listening
                        ? Colors.red
                        : null,
                  ),
                  onPressed: listening
                      ? _stopListening
                      : _startListening,
                ),

                const SizedBox(
                  width: 8,
                ),

                Expanded(
                  child: ElevatedButton(
                    onPressed: loading
                        ? null
                        : _askGemini,
                    child: loading
                        ? const SizedBox(
                            width: 18,
                            height: 18,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                            ),
                          )
                        : const Text(
                            "Ask",
                          ),
                  ),
                ),
              ],
            ),

            const SizedBox(
              height: 12,
            ),

            if (response !=
                null)
              Text(
                response!,
                style: const TextStyle(
                  fontSize: 14,
                ),
              ),

            const SizedBox(
              height: 8,
            ),
          ],
        ),
      ),
    );
  }

  Future<
    void
  >
  _startListening() async {
    final available = await _speech.initialize();

    if (!available) return;

    setState(
      () {
        listening = true;
      },
    );

    await _speech.listen(
      onResult:
          (
            result,
          ) {
            controller.text = result.recognizedWords;
          },
    );
  }

  Future<
    void
  >
  _stopListening() async {
    await _speech.stop();
    setState(
      () {
        listening = false;
      },
    );
  }

  Future<
    void
  >
  _askGemini() async {
    final prompt = controller.text.trim();
    if (prompt.isEmpty) return;

    setState(
      () {
        loading = true;
        response = null;
      },
    );

    try {
      final reply = await api.generate(
        prompt,
      );

      if (!mounted) return;

      setState(
        () {
          response = reply;
          loading = false;
        },
      );

      await _tts.stop();
      await _tts.speak(
        reply,
      );
    } catch (
      e
    ) {
      if (!mounted) return;

      setState(
        () {
          response = e.toString();
          loading = false;
        },
      );
    }
  }
}
