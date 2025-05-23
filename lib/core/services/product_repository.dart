import '../models/product.dart';
import 'package:collection/collection.dart';


class ProductRepository {
  static final List<Product> _products = [
    Product()
      ..name = 'CU 불닭 삼각김밥'
      ..barcode = '8801111222333'
      ..ingredients = 'Rice, Seaweed, Spicy Chicken Sauce'
      ..allergens = ['Wheat', 'Soy', 'Chicken'],
  
    Product()
      ..name = 'CU 바나나우유'
      ..barcode = '8809876543210'
      ..ingredients = 'Milk, Banana Flavoring, Sugar'
      ..allergens = ['Milk'],
  ];

  static Product? getByBarcode(String barcode) {
    return _products.firstWhereOrNull(
      (product) => product.barcode == barcode,
    );
  }
}
