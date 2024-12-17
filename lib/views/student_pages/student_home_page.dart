import 'package:flutter/material.dart';
import 'kost_list_page.dart';
import 'favorite_page.dart';
import 'profile_page.dart';

class StudentHomePage extends StatefulWidget {
  @override
  _StudentHomePageState createState() => _StudentHomePageState();
}

class _StudentHomePageState extends State<StudentHomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    KostListPage(),
    FavoritePage(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _selectedIndex == 0
              ? "TechKos"
              : _selectedIndex == 1
              ? "Favorites"
              : "Profile",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF0D47A1), // Updated background color
        elevation: 2,
      ),
      body: Container(
        color: Color(0xFF0D47A1), // Set the background color here
        child: AnimatedSwitcher(
          duration: Duration(milliseconds: 300),
          child: _pages[_selectedIndex],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "List Kost",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "Favorites",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
        selectedItemColor: Colors.white, // White for selected item
        unselectedItemColor: Colors.grey.shade300, // Light grey for unselected
        showUnselectedLabels: false,
        backgroundColor: Color(0xFF0D47A1), // Updated to match theme
        elevation: 5,
      ),
    );
  }
}
