import 'package:contacts_exos/Constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/painting/image_stream.dart';
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
  Future<void> fetchData() async {
    try {
      final response = await Dio().get(npointUrl);
      final jsonData = response.data;
      if (jsonData is List) {
        setState(() {
          data = jsonData.cast<Map<String, dynamic>>();
        });
      }
    } catch (e) {
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
    return GridView.builder(
        itemCount: data.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: 240,
        ),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Single_maison(
              maison_pict: data[index]['picture'],
              maison_salle: data[index]['salles'],
              maison_prix: data[index]['prix'],
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
      child: Image.network(
        widget.maison_pict,
        fit: BoxFit.cover,
        loadingBuilder: (BuildContext context, Widget child,
            ImageChunkEvent? loadingProgress) {
          if (loadingProgress == null) {
            return child;
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
        errorBuilder:
            (BuildContext context, Object exception, StackTrace? stackTrace) {
          return Placeholder(
            fallbackWidth: 200,
            fallbackHeight: 100,
            strokeWidth: 2,
            color: Colors.white,
          );
        },
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
