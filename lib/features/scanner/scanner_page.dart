import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'scanner_controller.dart';
import '/core/services/product_repository.dart';

class BarcodeScannerPage extends StatefulWidget {
  const BarcodeScannerPage({super.key});

  @override
  State<BarcodeScannerPage> createState() => _BarcodeScannerPageState();
}

class _BarcodeScannerPageState extends State<BarcodeScannerPage>{
    final ScannerController _scannerController = ScannerController();

    void _handleScan(String code){
        final product = ProductRepository.getByBarcode(code);
        final info = product != null
            ? '${product.name}\n\nIngredients: ${product.ingredients}\nAllergens: ${product.allergens.join(', ')}'
            : 'Product not found.';

        showDialog(
            context: context,
            builder: (_) => AlertDialog(
                title: const Text('Barcode Scanned'),
                content: Text('Code: $code\n\n$info'),
                actions: [
                    TextButton(
                        onPressed: (){
                            Navigator.pop(context);
                            _scannerController.reset(); // Re-enable scanning
                        },
                        child: const Text('OK'))
                ],
            ),
        );
    }

    @override
    Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Scan a Product')),
      body: MobileScanner(
        controller: _scannerController.scanner,
        onDetect: (capture) {
          _scannerController.onDetect(capture, _handleScan);
        },
      ),
    );
  }
}
