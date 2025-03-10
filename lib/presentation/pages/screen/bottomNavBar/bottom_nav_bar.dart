import 'package:flutter/material.dart';
import 'package:maktrack/domain/entities/asset_path.dart';
import 'package:maktrack/domain/entities/color.dart';
import 'package:maktrack/presentation/pages/screen/home/home_screen.dart';

class Bottom extends StatefulWidget {
  const Bottom({super.key});

  @override
  _BottomState createState() => _BottomState();
}

class _BottomState extends State<Bottom> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomeScreen(),
    const Center(child: Text("Files Page")),
    const Center(child: Text("Send Page")),
    const Center(child: Text("Profile Page")),
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
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
        child: BottomAppBar(
          color: Colors.grey[100],
          shape: const CircularNotchedRectangle(),
          notchMargin: 10,
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => _onItemTapped(0),
                  child: Image.asset(AssetPath.basePathListImage),
                ),
                GestureDetector(
                  onTap: () => _onItemTapped(1),
                  child: Image.asset(AssetPath.basePathDocFileImage),
                ),
                SizedBox(
                  width: 48,
                ),
                GestureDetector(
                  onTap: () => _onItemTapped(2),
                  child: Image.asset(AssetPath.basePathSendImage),
                ),
                GestureDetector(
                  onTap: () => _onItemTapped(3),
                  child: const CircleAvatar(
                    radius: 20,
                    child: Icon(
                      Icons.man,
                      color: RColors.blueButtonColors,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: RColors.blueButtonColors,
        shape: const CircleBorder(),
        child: Image.asset(AssetPath.basePathImage),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
