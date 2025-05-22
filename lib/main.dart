import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

int detectionTimeout = 3;

final MobileScannerController scanController =  MobileScannerController(
  detectionSpeed: DetectionSpeed.normal,
  detectionTimeoutMs: detectionTimeout
);

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BarcodeScannerPage(),
    );
  }
}

class BarcodeScannerPage extends StatelessWidget {
  BarcodeScannerPage({super.key});

  final Map<String, String> fakeProductDB = {
    '8801045678901': 'Choco Pie – Contains: Wheat, Egg, Milk, Soy',
    '8809123456789': 'Banana Milk – Contains: Milk',
  };


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Scan a Product')),
      body: MobileScanner(
        controller: scanController,
        onDetect: (capture) {
          final String? code = capture.barcodes.first.rawValue;
          if (code != null){
            final info = fakeProductDB[code] ?? 'Product not found.';
            showDialog(
              context: context,
              builder: (_) => AlertDialog(
                title: Text('Barcode Scanned'),
                content: Text('Code: $code\n\n$info'),
                actions: [
                  TextButton(onPressed: () => Navigator.pop(context),
                  child: Text('OK'),
                  ),
                ],
              ),
            );
          } 
        }, 
      ),
    );
  }
}
