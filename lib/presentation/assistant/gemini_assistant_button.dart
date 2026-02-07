// SKELETON: Floating action button that opens the Gemini agent assistant UI.
// This widget must remain UI-only. No LLM or workflow logic belongs here.

import 'package:flutter/material.dart';

import 'gemini_chat_sheet.dart';

class GeminiAssistantButton extends StatelessWidget {
  const GeminiAssistantButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: 'gemini_fab',
      backgroundColor: Colors.deepPurple,
      child: const Icon(Icons.auto_awesome),
      onPressed: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (_) => const GeminiChatSheet(),
        );
      },
    );
  }
}
