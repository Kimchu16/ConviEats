import 'package:mobile_scanner/mobile_scanner.dart';

class ScannerController {
  final MobileScannerController scanner = MobileScannerController();
  bool _hasScanned = false;

  /// Called when barcode is detected from the scanner.
  void onDetect(BarcodeCapture capture, Function(String code) onScan) {
    if (_hasScanned) return;

    final String? code = capture.barcodes.first.rawValue;
    if (code == null) return;

    _hasScanned = true;
    onScan(code);
  }

  // Resets timer
  void reset() {
    _hasScanned = false;
  }
}
