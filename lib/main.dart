import 'package:convi_eats/ui/screens/scan_page_ui.dart';
import 'package:flutter/material.dart';
import 'core/services/local_database_service.dart';
import 'package:convi_eats/ui/screens/history_page_ui.dart';
import 'package:convi_eats/ui/widgets/app_bottom_nav_bar.dart';

/*
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
      home: HistoryPage(),
    );
  }
}
*/

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalDatabaseService.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static final List<Widget> _pages = <Widget>[
    ScanPageUI(),
    HistoryPage(),
    Center(child: Text('Saved page coming soon!')), // placeholder for Saved
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: AppBottomNavBar(
        currentIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
