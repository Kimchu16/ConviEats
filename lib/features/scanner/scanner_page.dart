import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'scanner_controller.dart';
import '/core/services/product_repository.dart';
import '/core/models/scanned_product.dart';
import '/core/services/scan_history_repository.dart';


class BarcodeScannerPage extends StatefulWidget {
  const BarcodeScannerPage({super.key});

  @override
  State<BarcodeScannerPage> createState() => _BarcodeScannerPageState();
}

class _BarcodeScannerPageState extends State<BarcodeScannerPage>{
    final ScannerController _scannerController = ScannerController();

    void _handleScan(String code) async{
        final product = ProductRepository.getByBarcode(code);

        if (product != null){
          //Save to scan-history
          await ScanHistoryRepository.save(
            ScannedProduct()
            ..product = product
            ..scannedAt = DateTime.now(),
          );
        }
        
        final info = product != null
            ? '${product.name}\n\nIngredients: ${product.ingredients}\nAllergens: ${product.allergens.join(', ')}'
            : 'Product not found.';
        

        /*
        if (product != null) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => ProductDetailsPage(product: product),
                ),
            ).then((_) {
                // Reset scanner after returning from the details screen
                Future.delayed(const Duration(seconds: 2), () {
                    _scannerController.reset();
                });
            });
        } else {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Product not found.')),
            );
            Future.delayed(const Duration(seconds: 2), () {
                _scannerController.reset();
            });
        }
        */ //Use this later for when UI frontend page is established and delete showDialog + info var

        showDialog(
            context: context,
            builder: (_) => AlertDialog(
                title: const Text('Barcode Scanned'),
                content: Text('Code: $code\n\n$info'),
                actions: [
                    TextButton(
                        onPressed: (){
                            Navigator.pop(context);
                            Future.delayed(const Duration(seconds: 2), (){
                                _scannerController.reset(); // Re-enable scanning
                            });
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
