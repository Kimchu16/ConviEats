import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import '../models/scanned_product.dart';
import '../models/saved_product.dart';

class LocalDatabaseService {
  static late Isar _isar;

  static Future<void> init() async {
    final dir = await getApplicationDocumentsDirectory();
    _isar = await Isar.open(
      [
        ScannedProductSchema,
        SavedProductSchema,
      ],
      directory: dir.path,
    );
  }

  static Isar get instance => _isar;
}
