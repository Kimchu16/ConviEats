import 'package:isar/isar.dart';
import '../models/scanned_product.dart';
import 'local_database_service.dart';

class ScanHistoryRepository {
  static final _isar = LocalDatabaseService.instance;

  // Add a scanned product to DB
  static Future<void> save(ScannedProduct product) async {
    await _isar.writeTxn(() async {
      await _isar.scannedProducts.put(product);
    });
  }

  // Fetch full scan history
  static Future<List<ScannedProduct>> getAll() async {
    return await _isar.scannedProducts.where().sortByScannedAtDesc().findAll();
  }

  // Clear all scans
  static Future<void> clear() async {
    await _isar.writeTxn(() async {
      await _isar.scannedProducts.clear();
    });
  }
}
