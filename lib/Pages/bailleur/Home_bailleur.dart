import 'package:contacts_exos/Constants/constants.dart';
import 'package:contacts_exos/Pages/bailleur/accueil_bailleur.dart';
import 'package:flutter/material.dart';

class home_bailleur extends StatefulWidget {
  const home_bailleur({super.key});

  @override
  State<home_bailleur> createState() => _home_bailleurState();
}

class _home_bailleurState extends State<home_bailleur> {
  List<Widget> option = [
    const page_bailleur(),
    Container(),
    Container(),
    Container(),
  ];

  int current = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: option[current],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Constants.royalBlue,
        currentIndex: current,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: "Accueil",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.calendar_month,
            ),
            label: "Agenda",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.chat_bubble,
            ),
            label: "Mes annonces",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
            ),
            label: "Mon compte",
          ),
        ],
        onTap: (index) {
          setState(() {
            current = index;
          });
        },
      ),
    );
  }
}
