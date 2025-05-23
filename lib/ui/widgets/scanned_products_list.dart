// lib/ui/widgets/scanned_products_list.dart

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:convi_eats/core/models/scanned_product.dart';

class ScannedProductsList extends StatelessWidget {
  final List<ScannedProduct> scannedProducts;

  const ScannedProductsList({super.key, required this.scannedProducts});

  @override
  Widget build(BuildContext context) {
    if (scannedProducts.isEmpty) {
      return const Center(child: Text('No scanned products found.'));
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: scannedProducts.length,
      itemBuilder: (context, index) {
        final scannedProduct = scannedProducts[index];
        final product = scannedProduct.product;
        final formattedDate =
        DateFormat.yMMMd().add_jm().format(scannedProduct.scannedAt);

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                product.name,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 4),
              Text(
                'Scanned at: $formattedDate',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(color: Colors.grey[600]),
              ),
            ],
          ),
        );
      },
    );
  }
}
