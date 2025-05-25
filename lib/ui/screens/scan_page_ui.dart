import 'package:flutter/material.dart';

import 'package:convi_eats/core/models/product.dart';
import 'package:convi_eats/core/models/scanned_product.dart';
import 'package:convi_eats/core/services/scan_history_repository.dart';
import 'package:convi_eats/core/services/product_repository.dart';

import 'package:convi_eats/features/scanner/scanner_view.dart';

import 'package:convi_eats/ui/widgets/product_info_card.dart';


class ScanPageUI extends StatefulWidget {
  const ScanPageUI({super.key});

  @override
  State<ScanPageUI> createState() => _ScanPageUIState();
}

class _ScanPageUIState extends State<ScanPageUI> {
  Product? _scannedProduct;

  void _handleScanComplete(String barcode) async {
    debugPrint('Scanned barcode: $barcode');

    // Lookup product in repository
    final product = ProductRepository.getByBarcode(barcode);

    setState(() {
      _scannedProduct = product;
    });

    if (product == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('No product found for barcode $barcode')),
      );
      return;
    }

    // ✅ Save scanned product to history
    final scannedProduct = ScannedProduct()
      ..product = product
      ..scannedAt = DateTime.now();

    await ScanHistoryRepository.save(scannedProduct);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _scannedProduct == null
      // Show full-screen scanner when no product scanned
          ? ScannerView(
        onScanComplete: _handleScanComplete,
      )
      // Show product info screen when product scanned
          : Column(
        children: [
          // Close button to go back to scanning
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                setState(() {
                  _scannedProduct = null;
                });
              },
            ),
          ),
          // Product info fills the rest of the screen
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 16.0),
              child: ProductInfoCard(product: _scannedProduct!),
            ),
          ),
        ],
      ),
    );
  }
}