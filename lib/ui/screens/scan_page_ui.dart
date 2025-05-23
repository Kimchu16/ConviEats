import 'package:convi_eats/core/services/product_repository.dart';
import 'package:flutter/material.dart';
import 'package:convi_eats/core/models/product.dart';
import 'package:convi_eats/features/scanner/scanner_view.dart';
import 'package:convi_eats/ui/widgets/app_bottom_nav_bar.dart';
import 'package:convi_eats/ui/widgets/product_info_card.dart';

class ScanPageUI extends StatefulWidget {
  const ScanPageUI({super.key});

  @override
  State<ScanPageUI> createState() => _ScanPageUIState();
}

class _ScanPageUIState extends State<ScanPageUI> {
  int _selectedIndex = 0;
  Product? _scannedProduct;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // TODO: Handle navigation if needed
  }

  void _handleScanComplete(String barcode) {
    debugPrint('Scanned barcode: $barcode');

    // Lookup product in repository
    final product = ProductRepository.getByBarcode(barcode);

    setState(() {
      _scannedProduct = product; // update the UI with the product info
    });

    if (product == null) {
      // You might want to show a message if product not found
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('No product found for barcode $barcode')),
      );
    }
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
              padding: const EdgeInsets.all(16.0),
              child: ProductInfoCard(product: _scannedProduct!),
            ),
          ),
        ],
      ),
      bottomNavigationBar: AppBottomNavBar(
        currentIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}