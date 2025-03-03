import 'package:flutter/material.dart';
import 'screens/home_page.dart'; // ✅ Changed import
import 'screens/setting_screen.dart';
import 'screens/profile_screen.dart';

class BottomNav extends StatefulWidget {
  final VoidCallback toggleTheme;
  BottomNav({required this.toggleTheme});

  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _selectedIndex = 0;
  late List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = [
      HomePage(), // ✅ Changed HomePage() to HomeScreen()
      SettingsScreen(toggleTheme: widget.toggleTheme),
      ProfileScreen(),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: "Settings"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
