import 'package:flutter/material.dart';
import 'features/scanner/scanner_page.dart';
import 'core/services/local_database_service.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await LocalDatabaseService.init(); // ← open the database
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BarcodeScannerPage(),
    );
  }
}
