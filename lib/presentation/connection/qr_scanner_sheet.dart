import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QrScannerSheet
    extends
        StatelessWidget {
  const QrScannerSheet({
    super.key,
  });

  @override
  Widget build(
    BuildContext context,
  ) {
    return SizedBox(
      height: 350,
      child: MobileScanner(
        onDetect:
            (
              capture,
            ) {
              final barcode = capture.barcodes.first;
              final value = barcode.rawValue;

              if (value !=
                  null) {
                Navigator.pop(
                  context,
                  value,
                );
              }
            },
      ),
    );
  }
}
