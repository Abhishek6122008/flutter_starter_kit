// SKELETON: Starter splash screen for the LG agentic Flutter kit.
// This screen is intentionally simple and contains no application logic.
// Navigation targets and workflows are injected by Antigravity agents.

import 'package:flutter/material.dart';

import '../../widgets/gradient_background.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GradientBackground(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // SKELETON BRANDING PLACEHOLDER
            // Agents may replace this asset when generating a real app.
            Image.asset(
              'assets/lg_logo.png',
              width: 220,
            ),
            const SizedBox(height: 20),

            const Text(
              'LG Agentic Flutter Starter Kit',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                decoration: TextDecoration.none,
              ),
            ),
            const SizedBox(height: 8),

            const Text(
              'Liquid Galaxy – Antigravity & Gemini workflow demo',
              style: TextStyle(
                fontSize: 14,
                color: Colors.white70,
                decoration: TextDecoration.none,
              ),
            ),

            const SizedBox(height: 32),

            ElevatedButton(
              onPressed: () {
                // SKELETON HOOK:
                // Real navigation and workflow startup
                // must be injected by agent workflows.
                //
                // Example (generated later):
                // Navigator.pushReplacementNamed(context, '/home');
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      'Starter kit skeleton – no workflow bound yet.',
                    ),
                  ),
                );
              },
              child: const Text('Start workflow'),
            ),
          ],
        ),
      ),
    );
  }
}
