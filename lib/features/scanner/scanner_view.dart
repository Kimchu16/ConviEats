import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'scanner_controller.dart';

class ScannerView extends StatelessWidget {
  final Function(String barcode) onScanComplete;

  const ScannerView({super.key, required this.onScanComplete});

  @override
  Widget build(BuildContext context) {
    final ScannerController _scannerController = ScannerController();

    return MobileScanner(
      controller: _scannerController.scanner,
      onDetect: (capture) {
        _scannerController.onDetect(capture, onScanComplete);
      },
    );
  }
}
