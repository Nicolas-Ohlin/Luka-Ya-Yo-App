import 'package:contacts_exos/Constants/constants.dart';
import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    double height =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Container(
              height: height * 0.34,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                ),
              ),
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
            SizedBox(
              height: height * 0.015,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.location_pin,
                          color: Constants.violetIris,
                          size: 18,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          "C/ N'Djili Q7 N°191",
                          style: TextStyle(
                            fontSize: 18,
                            color: Constants.violetIris,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.calendar_month,
                          color: Constants.violetIris,
                          size: 18,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          "Le 07/03/204 de 10H00-17h00",
                          style: TextStyle(
                            fontSize: 16,
                            color: Constants.violetIris,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  width: 80,
                  height: height * 0.09,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(color: Constants.violetIris, width: 1),
                  ),
                  child: Icon(
                    Icons.person,
                    color: Constants.violetIris,
                  ),
                ),
              ],
            ),
            Container()
          ],
        ),
      ),
    );
  }
}
