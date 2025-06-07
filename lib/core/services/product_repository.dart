/*
Fake product database. local static list of known products with barcodes, ingredients, and allergens.
===========================================================
getByBarcode(String code) fetches a product by its barcode.
===========================================================
*/
import '../models/product.dart';
import 'package:collection/collection.dart';

class ProductRepository {
  static final List<Product> _products = [
    Product()
      ..name = "Oreo O's"
      ..barcode = '8801037065619'
      ..ingredients = 'Corn Cereal, Vegetable Oils, Cocoa Powder, Marshmallow, Salt'
      ..allergens = ['Wheat', 'Soy', 'Milk', 'Pork']
      ..imageAssetPath = 'assets/images/oreo_icon.jpg'
      ..expirationDate = DateTime(2026, 02, 10),

    Product()
      ..name = 'Buldak Triangle Kimchi Gimbap'
      ..barcode = '8801111222333'
      ..ingredients = 'Rice, Seaweed, Spicy Chicken Sauce'
      ..allergens = ['Wheat', 'Soy', 'Chicken']
      ..imageAssetPath = 'assets/images/oreo_icon.jpg'
      ..expirationDate = DateTime(2025, 06, 04),
  
    Product()
      ..name = 'Banana Milk'
      ..barcode = '8809876543210'
      ..ingredients = 'Milk, Banana Flavoring, Sugar'
      ..allergens = ['Milk']
      ..imageAssetPath = 'assets/images/oreo_icon.jpg'
      ..expirationDate = DateTime(2025, 06, 03),
    
     Product()
      ..name = 'Shin Ramyeon'
      ..barcode = '8801043014809'
      ..ingredients = 'Wheat Noodles, Spicy Soup Base, Dried Vegetables'
      ..allergens = ['Wheat', 'Soy', 'Shellfish']
      ..imageAssetPath = 'assets/images/81spphKc0BL.jpg'
      ..expirationDate = DateTime(2025, 11, 03),

  ];

  static Product? getByBarcode(String barcode) {
    return _products.firstWhereOrNull(
      (product) => product.barcode == barcode,
    );
  }
}
