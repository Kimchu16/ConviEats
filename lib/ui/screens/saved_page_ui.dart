import 'package:flutter/material.dart';
import 'package:convi_eats/core/models/saved_product.dart';
import 'package:convi_eats/core/services/saved_products_repository.dart';
import 'package:convi_eats/ui/widgets/product_info_card.dart'; // Adjust path as needed

class SavedPage extends StatefulWidget {
  const SavedPage({super.key});

  @override
  State<SavedPage> createState() => _SavedPageState();
}

class _SavedPageState extends State<SavedPage> {
  late Future<List<SavedProduct>> _savedProducts;

  @override
  void initState() {
    super.initState();
    _loadSavedProducts();
  }

  void _loadSavedProducts() {
    setState(() {
      _savedProducts = SavedProductsRepository.getAll();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Saved Products',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.lightGreen,
          ),
        ),
      ),
      body: SafeArea(
        child: FutureBuilder<List<SavedProduct>>(
          future: _savedProducts,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text('No saved products found.'));
            }

            final savedList = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ListView.builder(
                itemCount: savedList.length,
                itemBuilder: (context, index) {
                  final saved = savedList[index];
                  final product = saved.product;

                  return GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        builder: (context) => Padding(
                          padding: const EdgeInsets.only(top: 32),
                          child: ClipRRect(
                            borderRadius: const BorderRadius.vertical(top: Radius.circular(28)),
                            child: Container(
                              color: Theme.of(context).scaffoldBackgroundColor,
                              padding: const EdgeInsets.all(20),
                              child: ProductInfoCard(product: product),
                            ),
                          ),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: Row(
                        children: [
                          Container(
                            width: 64,
                            height: 64,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(8),
                              image: product.imageAssetPath.isNotEmpty
                                  ? DecorationImage(
                                image: AssetImage(product.imageAssetPath),
                                fit: BoxFit.cover,
                              )
                                  : null,
                            ),
                            child: product.imageAssetPath.isEmpty
                                ? const Center(
                              child: Text(
                                'Picture',
                                style: TextStyle(fontSize: 10),
                              ),
                            )
                                : null,
                          ),
                          const SizedBox(width: 16),
                          Text(
                            product.name,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.normal,
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
