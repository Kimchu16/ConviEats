import 'package:isar/isar.dart';

part 'product.g.dart';

@embedded
class Product {
  late String name;
  late String barcode;
  late String ingredients;
  late List<String> allergens;

  Product();
}
