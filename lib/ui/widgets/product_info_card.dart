import 'package:flutter/material.dart';
import 'package:convi_eats/core/models/product.dart';

class ProductInfoCard extends StatelessWidget {
  final Product product;

  const ProductInfoCard({required this.product, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              product.name,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            SizedBox(height: 8),
            Text('Barcode: ${product.barcode}'),
            SizedBox(height: 8),
            Text('Ingredients: ${product.ingredients}'),
            SizedBox(height: 8),
            Text('Allergens: ${product.allergens.join(', ')}'),
          ],
        ),
      ),
    );
  }
}
