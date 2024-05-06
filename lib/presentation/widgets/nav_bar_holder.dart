import 'package:dog_ceo_api/presentation/pages/home_page.dart';
import 'package:dog_ceo_api/presentation/pages/prompt_page.dart';
import 'package:dog_ceo_api/presentation/pages/settings_page.dart';
import 'package:flutter/material.dart';

class NavBarHolder extends StatefulWidget {
  const NavBarHolder({super.key});

  @override
  State<NavBarHolder> createState() => _NavBarHolderState();
}

class _NavBarHolderState extends State<NavBarHolder> {
  int _selectedIndex = 1;
  static List<Widget> widgetOptions = <Widget>[
    const PromptPage(),
    const HomePage(),
    const SettingsPage(),
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
        child: widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'Prompt',
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
