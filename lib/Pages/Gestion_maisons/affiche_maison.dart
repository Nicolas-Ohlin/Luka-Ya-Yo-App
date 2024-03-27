import 'package:contacts_exos/Constants/constants.dart';
import 'package:contacts_exos/Pages/accueil_page.dart';
import 'package:flutter/material.dart';
import 'package:faker/faker.dart';

class affiche_maison extends StatefulWidget {
  final maison_pict;
  final maison_salle;
  final maison_prix;
  const affiche_maison({
    super.key,
    required this.maison_pict,
    required this.maison_salle,
    required this.maison_prix,
  });

  @override
  State<affiche_maison> createState() => _affiche_maisonState();
}

class _affiche_maisonState extends State<affiche_maison> {
  String lorem = Faker().lorem.sentence();

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
    double height = MediaQuery.of(context).size.height -
        appBar.preferredSize.height -
        MediaQuery.of(context).padding.top;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                ),
                child: Container(
                  height: height * 0.34,
                  child: Image.network(
                    widget.maison_pict,
                    fit: BoxFit.cover,
                    loadingBuilder: (BuildContext context, Widget child,
                        ImageChunkEvent? loadingProgress) {
                      if (loadingProgress == null) {
                        return child;
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(
                            color: Colors.deepPurpleAccent,
                          ),
                        );
                      }
                    },
                    errorBuilder: (BuildContext context, Object exception,
                        StackTrace? stackTrace) {
                      return const Center(
                        child: Padding(
                          padding: EdgeInsets.all(15.0),
                          child: Text(
                            "Problème de connexion ou image non disponible!",
                            style: TextStyle(
                              color: Colors.deepPurpleAccent,
                              fontSize: 16,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => const Accueil(),
                    ),
                  );
                },
                child: const Padding(
                  padding: EdgeInsets.all(20),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(Icons.arrow_back),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: height * 0.015,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.location_pin,
                          color: Constants.violetIris,
                          size: 22,
                        ),
                        const SizedBox(
                          width: 7,
                        ),
                        SizedBox(
                          height: height * 0.015,
                        ),
                        Text(
                          "C/ N'Djili Q7 N°191",
                          style: TextStyle(
                            fontSize: 22,
                            color: Constants.violetIris,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.015,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.calendar_month,
                          color: Constants.violetIris,
                          size: 18,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          "Le 07/03/204 de 10H00-17h00",
                          style: TextStyle(
                            fontSize: 18,
                            color: Constants.violetIris,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
              "Details:",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.black),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(10),
                height: height * 0.25,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.grey[100],
                ),
                child: Text(
                  lorem,
                  style: TextStyle(
                    color: Colors.grey[700],
                  ),
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
              "Mois de garanti",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.black),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              "25 mois",
              style: TextStyle(
                fontSize: 16,
                color: Constants.violetIris.withOpacity(0.8),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${widget.maison_prix}/mois",
                  style: TextStyle(
                    fontSize: 35,
                    color: Constants.violetIris,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Constants.violetIris,
                      fixedSize: const Size(150, 55),
                      padding: const EdgeInsets.all(16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {},
                    child: const Text(
                      "Visiter",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
