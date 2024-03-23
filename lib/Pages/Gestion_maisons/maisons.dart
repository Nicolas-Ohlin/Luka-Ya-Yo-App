import 'package:contacts_exos/Constants/constants.dart';
import 'package:contacts_exos/Pages/Gestion_maisons/affiche_maison.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class Tous extends StatefulWidget {
  const Tous({super.key});

  @override
  State<Tous> createState() => _TousState();
}

class _TousState extends State<Tous> {
  // https://api.npoint.io/594385773d3cf59c5ecd
  final String npointUrl = "https://api.npoint.io/5ea27ea97ea815403593";
  List<Map<String, dynamic>> data = [];
  bool isLoading = false;
  bool isConnected = true;
  Future<void> fetchData() async {
    try {
      final response = await Dio().get(npointUrl);
      final jsonData = response.data;
      if (jsonData is List) {
        setState(() {
          isLoading = true;
          data = jsonData.cast<Map<String, dynamic>>();
          isConnected = true;
          isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        isConnected = false;
      });

      print('Erreur lors de la recuperation des données : $e');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return isConnected
        ? GridView.builder(
            itemCount: data.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisExtent: 240,
              crossAxisSpacing: 7,
              mainAxisSpacing: 7,
            ),
            itemBuilder: (context, index) {
              return isLoading
                  ? const CircularProgressIndicator(
                      color: Colors.deepPurpleAccent,
                    )
                  : Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Single_maison(
                        maison_pict: data[index]['picture'],
                        maison_salle: data[index]['salles'],
                        maison_prix: data[index]['prix'],
                      ),
                    );
            },
          )
        : Center(
            child: Text(
              "Problème de connexion. Veillez vous assurer d'etre connecté à Internet.",
              style: TextStyle(
                fontSize: 16,
                color: Constants.violetIris.withOpacity(0.7),
              ),
              textAlign: TextAlign.center,
            ),
          );
  }
}

class Single_maison extends StatefulWidget {
  const Single_maison({
    super.key,
    this.maison_pict,
    this.maison_salle,
    this.maison_prix,
  });
  final maison_pict;
  final maison_salle;
  final maison_prix;

  @override
  State<Single_maison> createState() => _Single_maisonState();
}

class _Single_maisonState extends State<Single_maison> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(
          () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => affiche_maison(
                  maison_pict: widget.maison_pict,
                  maison_salle: widget.maison_salle,
                  maison_prix: widget.maison_prix,
                ),
              ),
            );
          },
        );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: GridTile(
          footer: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(17),
                topLeft: Radius.circular(17),
              ),
              color: Colors.white70,
            ),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.maison_salle,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(80, 86, 196, 1.0),
                    ),
                  ),
                  Text(
                    widget.maison_prix,
                    style: TextStyle(
                      color: Constants.violetIris,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
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
                      fontSize: 12,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class Studios extends StatefulWidget {
  const Studios({super.key});

  @override
  State<Studios> createState() => _StudiosState();
}

class _StudiosState extends State<Studios> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class Cloture extends StatefulWidget {
  const Cloture({super.key});

  @override
  State<Cloture> createState() => _ClotureState();
}

class _ClotureState extends State<Cloture> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
