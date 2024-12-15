import 'package:flutter/material.dart';
import 'manage_kost_page.dart';
import 'profile_page.dart';

class OwnerHomePage extends StatefulWidget {
  @override
  _OwnerHomePageState createState() => _OwnerHomePageState();
}

class _OwnerHomePageState extends State<OwnerHomePage> {
  int _selectedIndex = 0;

  // Define the pages for the owner (removed the dashboard page)
  final List<Widget> _pages = [
    ManageKostPage(), // Page to manage kost
    ProfilePage(), // Owner's profile page
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
              ? "Manage Kost"
              : "Profile",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF0D47A1),
        elevation: 2,
      ),
      body: Container(
        color: Colors.white,
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
            icon: Icon(Icons.edit),
            label: "Manage Kost",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey.shade300,
        showUnselectedLabels: false,
        backgroundColor: Color(0xFF0D47A1),
        elevation: 5,
      ),
    );
  }
}
