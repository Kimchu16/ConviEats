import 'package:flutter/material.dart';
import 'package:convi_eats/core/models/product.dart';
import 'dart:io';

class ProductInfoCard extends StatelessWidget {
  final Product product;

  const ProductInfoCard({required this.product, super.key});

  @override
  Widget build(BuildContext context) {
    final imageWidget = _buildImage(product.imageAssetPath);
    final textTheme = Theme.of(context).textTheme;

    final halal = 'xx';
    final meat = 'xx';
    final grams = 'xx';
    final calories = 'xx';

    final ingredientList = product.ingredients.split(',').map((e) => e.trim()).toList();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(0),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                ),
                child: IntrinsicHeight(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Center(
                        child: Text(
                          product.name,
                          style: textTheme.headlineMedium?.copyWith(color: Colors.lightGreen[700]),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 120,
                            height: 120,
                            color: Colors.grey[300],
                            child: imageWidget ?? const Center(child: Text('Picture')),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Halal: $halal'),
                                const SizedBox(height: 4),
                                Text('Meat: $meat'),
                                const SizedBox(height: 4),
                                Text('Grams: $grams'),
                                const SizedBox(height: 4),
                                Text('Calories: $calories'),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.redAccent[100],
                          borderRadius: BorderRadius.circular(8), // Rounded corners here
                        ),
                        child: Text(
                          'Expiration Date: ${product.expirationDate != null ? _formatDate(product.expirationDate!) : 'DD.MM.YY'}',
                          style: const TextStyle(
                            fontWeight: FontWeight.normal,
                            color: Colors.black45
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.lightGreen[300],
                          borderRadius: BorderRadius.circular(8), // Rounded corners here
                        ),
                        child: Text(
                          'Ingredients',
                          style: const TextStyle(
                            fontWeight: FontWeight.normal,
                            color: Colors.black45
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      ...ingredientList.map((ingredient) {
                        return Container(
                          margin: const EdgeInsets.symmetric(vertical: 4),
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(ingredient),
                              const Text('xx g'), // Placeholder grams
                            ],
                          ),
                        );
                      }),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget? _buildImage(String path) {
    if (path.isEmpty) return null;

    if (path.startsWith('/')) {
      return Image.file(
        File(path),
        fit: BoxFit.cover,
      );
    } else {
      return Image.asset(
        path,
        fit: BoxFit.cover,
      );
    }
  }

  String _formatDate(DateTime date) {
    final day = date.day.toString().padLeft(2, '0');
    final month = date.month.toString().padLeft(2, '0');
    final year = date.year.toString().substring(2);
    return '$day.$month.$year';
  }
}
