/*
Centralized Isar database setup for your entire app.
Ensures one consistent instance of the database is used throughout.
================================================================
Use LocalDatabaseService.instance to access Isar from anywhere.
================================================================
*/
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
