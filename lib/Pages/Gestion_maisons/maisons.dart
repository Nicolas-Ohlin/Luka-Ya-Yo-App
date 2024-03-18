import 'package:contacts_exos/Constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class Tous extends StatefulWidget {
  const Tous({super.key});

  @override
  State<Tous> createState() => _TousState();
}

class _TousState extends State<Tous> {
  // https://api.npoint.io/594385773d3cf59c5ecd
  final String npointUrl = 'https://api.npoint.io/594385773d3cf59c5ecd';
  Future<void> fetchData() async {
    try {
      final response = await Dio().get(npointUrl);
      final data = response.data;
      print(data);
    } catch (e) {
      print('Erreur lors de la recuperation des données : $e');
    }
  }

  var listMaison = [
    {
      "picture": "",
      "salles": "1/2/2",
      "prix": "150\$",
    },
    {
      "picture": "",
      "salles": "1/1/2",
      "prix": "310\$",
    },
    {
      "picture": "",
      "salles": "1/1/1",
      "prix": "100\$",
    },
    {
      "picture": "",
      "salles": "1/1/3",
      "prix": "250\$",
    },
    {
      "picture": "",
      "salles": "1/2/5",
      "prix": "450\$",
    },
    {
      "picture": "",
      "salles": "1/2/4",
      "prix": "300\$",
    },
  ];
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: listMaison.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: 240,
        ),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Single_maison(
              maison_pict: listMaison[index]['picture'],
              maison_salle: listMaison[index]['salles'],
              maison_prix: listMaison[index]['prix'],
            ),
          );
        });
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
    return GridTile(
      child: Image.asset(
        widget.maison_pict,
        fit: BoxFit.cover,
      ),
      footer: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.maison_salle,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
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
    return const Placeholder();
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
    return const Placeholder();
  }
}
