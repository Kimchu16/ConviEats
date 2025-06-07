import 'package:flutter/material.dart';
import 'package:convi_eats/core/models/product.dart';
import 'package:convi_eats/core/models/saved_product.dart';
import 'package:convi_eats/core/services/saved_products_repository.dart';
import 'dart:io';

class ProductInfoCard extends StatefulWidget {
  final Product product;

  const ProductInfoCard({required this.product, super.key});

  @override
  State<ProductInfoCard> createState() => _ProductInfoCardState();
}

class _ProductInfoCardState extends State<ProductInfoCard> {
  bool _isSaved = false;

  @override
  void initState() {
    super.initState();
    _checkIfSaved();
  }

  Future<void> _checkIfSaved() async {
    final savedItems = await SavedProductsRepository.getAll();
    final isSaved = savedItems.any((item) => item.product.barcode == widget.product.barcode);
    setState(() {
      _isSaved = isSaved;
    });
  }

  Future<void> _toggleSave() async {
    if (_isSaved) {
      final savedItems = await SavedProductsRepository.getAll();
      final itemToRemove = savedItems.firstWhere((item) => item.product.barcode == widget.product.barcode);
      await SavedProductsRepository.remove(itemToRemove.id);
    } else {
      final savedProduct = SavedProduct()..product = widget.product;
      await SavedProductsRepository.save(savedProduct);
    }

    setState(() {
      _isSaved = !_isSaved;
    });
  }

  @override
  Widget build(BuildContext context) {
    final imageWidget = _buildImage(widget.product.imageAssetPath);
    final textTheme = Theme.of(context).textTheme;

    final halal = 'No';
    final meat = 'Yes';
    final grams = '120';
    final calories = '500';

    final ingredientList = widget.product.ingredients.split(',').map((e) => e.trim()).toList();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(0),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Center(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              widget.product.name,
                              style: textTheme.headlineMedium?.copyWith(color: Colors.lightGreen[700]),
                            ),
                            IconButton(
                              iconSize: 32,
                              icon: Icon(
                                _isSaved ? Icons.star : Icons.star_border,
                                color: _isSaved ? Colors.yellow[700] : Colors.grey,
                              ),
                              onPressed: _toggleSave,
                              tooltip: _isSaved ? 'Unsave' : 'Save',
                            ),
                          ],
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
                      _buildInfoSection('Expiration Date: ${widget.product.expirationDate != null ? _formatDate(widget.product.expirationDate!) : 'DD.MM.YY'}', Colors.red[200]),
                      const SizedBox(height: 16),
                      _buildInfoSection('Ingredients', Colors.lightGreen[200]),
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
                              const Text('120 g'), // Placeholder grams
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
      return Image.file(File(path), fit: BoxFit.cover);
    } else {
      return Image.asset(path, fit: BoxFit.cover);
    }
  }

  String _formatDate(DateTime date) {
    final day = date.day.toString().padLeft(2, '0');
    final month = date.month.toString().padLeft(2, '0');
    final year = date.year.toString().substring(2);
    return '$day.$month.$year';
  }

  Widget _buildInfoSection(String text, Color? color) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.normal,
          color: Colors.black45,
        ),
      ),
    );
  }
}
