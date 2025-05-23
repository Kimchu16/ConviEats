import 'package:flutter/material.dart';

class AppBottomNavBar extends StatelessWidget {
    final int currentIndex;
    final ValueChanged<int> onItemTapped;

    const AppBottomNavBar({
        super.key,
        required this.currentIndex,
        required this.onItemTapped,
    });

    @override
    Widget build(BuildContext context) {
      // TODO: implement build
        return BottomNavigationBar(
        backgroundColor: Colors.grey[700],
        selectedItemColor: Colors.lightGreen[600],
        unselectedItemColor: Colors.white70,
        currentIndex: currentIndex,
        onTap: onItemTapped,
        items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.qr_code_scanner),
                label: 'Scan',
                ),
            BottomNavigationBarItem(
                icon: Icon(Icons.history),
                label: 'History',
                ),
            BottomNavigationBarItem(
                icon: Icon(Icons.save),
                label: 'Saved',
                ),
            ],
        );
    }
}

