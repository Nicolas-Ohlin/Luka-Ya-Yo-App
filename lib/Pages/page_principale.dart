import 'package:contacts_exos/Pages/accueil_page.dart';
import 'package:contacts_exos/Pages/favorite_page.dart';
import 'package:contacts_exos/Pages/reserve_page.dart';
import 'package:flutter/material.dart';

class pagePrincipale extends StatefulWidget {
  const pagePrincipale({super.key});

  @override
  State<pagePrincipale> createState() => _pagePrincipaleState();
}

class _pagePrincipaleState extends State<pagePrincipale> {
  int _selectedIndex = 0;
  final List<Widget> _pages = [
    Accueil(),
    Favorite(),
    Reserve(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 2.0,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        currentIndex: _selectedIndex,
        unselectedItemColor: Colors.grey[500],
        selectedItemColor: Colors.blueAccent,
        showSelectedLabels: false,
        showUnselectedLabels: true,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Accueil",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite,
            ),
            label: "Favorite",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.hourglass_top_rounded),
            label: "Reserve",
          ),
        ],
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
