import 'package:flutter/material.dart';
import '../../screens/connection/connection_screen.dart';
import '../../screens/widgets/gradient_background.dart';

class StartScreen
    extends
        StatelessWidget {
  const StartScreen({
    super.key,
  });

  @override
  Widget build(
    BuildContext context,
  ) {
    return GradientBackground(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/lg_logo.png',
              width: 240,
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Agentic Flutter Starter Kit',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                decoration: TextDecoration.none,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            const Text(
              'Liquid Galaxy Project',
              style: TextStyle(
                fontSize: 14,
                color: Colors.white70,
                decoration: TextDecoration.none,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder:
                        (
                          context,
                        ) => const ConnectionScreen(),
                  ),
                );
              },
              child: const Text(
                'Start',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
