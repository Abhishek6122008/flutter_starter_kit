// SKELETON: QR scanner sheet for LG connection workflows.
//
// This widget is UI-only.
// Real camera access and QR decoding must be provided
// by Antigravity agent workflows (not inside the starter kit).

import 'package:flutter/material.dart';

class QrScannerSheet extends StatelessWidget {
  const QrScannerSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.qr_code_scanner,
              size: 72,
              color: Colors.white70,
            ),
            const SizedBox(height: 16),
            const Text(
              'QR scanning workflow placeholder',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Camera access and QR decoding are provided\nby agent workflows.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white70,
              ),
            ),
            const SizedBox(height: 24),

            // SKELETON HOOK
            ElevatedButton(
              onPressed: () {
                // Example placeholder value.
                // Agents may replace this with real scan output.
                Navigator.pop(context, 'lg-host:22');
              },
              child: const Text('Simulate scan'),
            ),
          ],
        ),
      ),
    );
  }
}
