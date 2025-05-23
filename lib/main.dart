import 'package:convi_eats/ui/screens/scan_page_ui.dart';
import 'package:flutter/material.dart';
import 'features/scanner/scanner_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ScanPageUI(),
    );
  }
}
