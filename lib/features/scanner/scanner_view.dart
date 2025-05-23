import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'scanner_controller.dart';

class ScannerView extends StatefulWidget {
  final Function(String barcode) onScanComplete;

  const ScannerView({super.key, required this.onScanComplete});

  @override
  State<ScannerView> createState() => _ScannerViewState();
}

class _ScannerViewState extends State<ScannerView> {
  final ScannerController _scannerController = ScannerController();

  @override
  Widget build(BuildContext context) {
    return MobileScanner(
      controller: _scannerController.scanner,
      onDetect: (capture) {
        _scannerController.onDetect(capture, widget.onScanComplete);
      },
    );
  }
}
