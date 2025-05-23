import 'package:isar/isar.dart';
import 'product.dart';

part 'saved_product.g.dart';

@collection
class SavedProduct {
  Id id = Isar.autoIncrement;

  late Product product;
}
