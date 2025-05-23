import 'package:flutter/material.dart';

class AppBottomNavBar extends StatelessWidget {
    final int currentIndex;
    final ValueChanged<int> onItemTapped;
    final Color? backgroundColor;
    final Color? iconColor;

    const AppBottomNavBar({
        super.key,
        required this.currentIndex,
        required this.onItemTapped,
        this.backgroundColor,
        this.iconColor,
    });

    @override
    Widget build(BuildContext context) {
      // TODO: implement build
        return BottomNavigationBar(
        backgroundColor: backgroundColor ?? Colors.grey[500],
        selectedItemColor: Colors.lightGreen[800],
        unselectedItemColor: iconColor ?? Colors.black54,
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

