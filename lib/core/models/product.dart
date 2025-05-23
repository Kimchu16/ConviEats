/*
Defines the base Product model: used to represent food items retrieved by scanning a barcode.
This is the reference model used by ProductRepository.
*/
import 'package:isar/isar.dart';

part 'product.g.dart';

@embedded
class Product {
  Id id = Isar.autoIncrement;
  late String name;
  late String barcode;
  late String ingredients;
  late List<String> allergens;

  Product();
}
