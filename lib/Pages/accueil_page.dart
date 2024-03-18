import 'package:contacts_exos/Constants/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

import 'Gestion_maisons/maisons.dart';

class Accueil extends StatefulWidget {
  const Accueil({super.key});

  @override
  State<Accueil> createState() => _AccueilState();
}

class _AccueilState extends State<Accueil> {
  List<String> listScroll = ["Tous", "Studio", "Cloture"];
  int current = 0;
  @override
  Widget build(BuildContext context) {
    List<Widget> maisons = [
      Tous(),
      Studios(),
      Cloture(),
    ];
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 40,
                    ),
                    Row(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 2.8 / 4,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Constants.royalBlue.withOpacity(0.25),
                          ),
                          child: Center(
                            child: TextField(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                prefixIcon: Icon(Icons.search),
                                hintText: "Recherche",
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Constants.violetIris,
                            fixedSize: Size(60, 50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: const Center(
                            child: Icon(Icons.search, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: 90,
                      child: ListView.builder(
                        itemCount: listScroll.length,
                        scrollDirection: Axis.horizontal,
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                current == index;
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 20, bottom: 10, right: 20),
                              child: Container(
                                padding: EdgeInsets.only(
                                  left: 32,
                                  right: 32,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: current == index
                                      ? Constants.violetIris
                                      : Constants.violetIris.withOpacity(0.25),
                                ),
                                child: Center(
                                  child: Text(
                                    listScroll[index],
                                    style: TextStyle(
                                      color: current == index
                                          ? Colors.white
                                          : Constants.violetIris,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                height: 650,
                child: maisons[current],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
