import 'package:flutter/material.dart';
import 'package:convi_eats/core/models/product.dart';
import 'dart:io';

class ProductInfoCard extends StatelessWidget {
  final Product product;

  const ProductInfoCard({required this.product, super.key});

  @override
  Widget build(BuildContext context) {
    final imageWidget = _buildImage(product.imageAssetPath);

    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (imageWidget != null) ...[
              Center(child: imageWidget),
              const SizedBox(height: 16),
            ],
            Text(
              product.name,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 8),
            Text('Barcode: ${product.barcode}'),
            const SizedBox(height: 8),
            Text('Ingredients: ${product.ingredients}'),
            const SizedBox(height: 8),
            Text('Allergens: ${product.allergens.join(', ')}'),
          ],
        ),
      ),
    );
  }

  Widget? _buildImage(String path) {
    if (path.isEmpty) return null;

    // Check if it's a local file or an asset
    if (path.startsWith('/')) {
      return Image.file(
        File(path),
        height: 150,
        fit: BoxFit.cover,
      );
    } else {
      return Image.asset(
        path,
        height: 150,
        fit: BoxFit.cover,
      );
    }
  }
}

