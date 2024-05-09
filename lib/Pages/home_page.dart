import 'package:contacts_exos/Constants/constants.dart';

import 'package:flutter/material.dart';

import 'lessor_or_tenantPage.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    double height =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                // Background image
                Container(
                  height: height * 2.5 / 4,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/house.jpeg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  height: 600, // Height of the gradient
                  child: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.white,
                        ],
                        stops: [0.00, 0.99],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: height * 0.015,
            ),
            const Text("FACILITE-TOI LA VIE!",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center),
            SizedBox(
              height: height * 0.010,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 1.5 / 2,
              child: const Center(
                child: Text(
                  "Besoins d'une maison de location en tant qu'étudiant? trouve et reserve la maison de ton choix avec LUKA YA YO !",
                  style: TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) =>
                          lessor_or_tenant_Page(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Constants.violetIris,
                  fixedSize: const Size(200, 50),
                  padding: const EdgeInsets.all(16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  "LOOK AT",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
