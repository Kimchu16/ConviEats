import 'package:isar/isar.dart';
import '../models/saved_product.dart';
import 'local_database_service.dart';

class SavedProductsRepository {
  static final _isar = LocalDatabaseService.instance;

  // Add product to saved list
  static Future<void> save(SavedProduct product) async {
    await _isar.writeTxn(() async {
      await _isar.savedProducts.put(product);
    });
  }

  // Fetch all saved items
  static Future<List<SavedProduct>> getAll() async {
    return await _isar.savedProducts.where().findAll();
  }

  // Delete a product by id
  static Future<void> remove(int id) async {
    await _isar.writeTxn(() async {
      await _isar.savedProducts.delete(id);
    });
  }

  // Clear all saved items
  static Future<void> clear() async {
    await _isar.writeTxn(() async {
      await _isar.savedProducts.clear();
    });
  }
}
