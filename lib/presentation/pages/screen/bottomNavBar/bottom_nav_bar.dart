import 'package:flutter/material.dart';

class BottomNavBarPage extends StatefulWidget {
  const BottomNavBarPage({super.key});

  @override
  _BottomNavBarPageState createState() => _BottomNavBarPageState();
}

class _BottomNavBarPageState extends State<BottomNavBarPage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Text(
          'Selected Index: $_selectedIndex',
          style: TextStyle(fontSize: 20),
        ),
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        decoration: BoxDecoration(
          color: Colors.red, // Background color
          borderRadius: BorderRadius.circular(20), // Optional rounded corners
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent, // Transparent background
          elevation: 0, // Remove shadow
          type: BottomNavigationBarType.fixed, // Fixes shifting issue
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.black54,
          onTap: _onItemTapped,
          currentIndex: _selectedIndex,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: ""),
          ],
        ),
      ),
    );
  }
}
