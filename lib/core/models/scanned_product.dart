import 'package:isar/isar.dart';
import 'product.dart';

part 'scanned_product.g.dart';

@collection
class ScannedProduct {
  Id id = Isar.autoIncrement;

  late Product product;
  late DateTime scannedAt;
}
