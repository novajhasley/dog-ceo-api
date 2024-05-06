import 'package:dog_ceo_api/presentation/pages/home_page.dart';
import 'package:dog_ceo_api/presentation/pages/info_page.dart';
import 'package:dog_ceo_api/presentation/pages/settings_page.dart';
import 'package:flutter/material.dart';

class NavBarHolder extends StatefulWidget {
  const NavBarHolder({super.key});

  @override
  State<NavBarHolder> createState() => _NavBarHolderState();
}

class _NavBarHolderState extends State<NavBarHolder> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    InfoPage(),
    HomePage(),
    SettingsPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'Info',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
