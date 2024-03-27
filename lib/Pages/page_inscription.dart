import 'dart:ui';

import 'package:contacts_exos/Pages/bailleur/Home_bailleur.dart';
import 'package:flutter/material.dart';

import '../Components/MyTextField2.dart';

class Inscription extends StatelessWidget {
  const Inscription({super.key});

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    final mailController = TextEditingController();
    final phoneController = TextEditingController();
    final pwdController = TextEditingController();
    final confirmPwdController = TextEditingController();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: [
            // Blurred background image
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/home2.jpeg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 100.0, left: 20.0),
              child: Text(
                "S'INSCRIRE",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                    color: Colors.white),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 160, left: 20),
              child: Text(
                'Donnez-nous plus d\'informations sur vous ! ',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomTextField(
                    labelText: "Nom d'utilisateur",
                    prefixIcon: const Icon(Icons.account_box_rounded),
                    obscureText: false,
                    controller: nameController,
                  ),
                  CustomTextField(
                    labelText: "Email",
                    prefixIcon: const Icon(Icons.mail),
                    obscureText: false,
                    controller: mailController,
                  ),
                  CustomTextField(
                    labelText: "Numero de téléphone",
                    prefixIcon: const Icon(Icons.phone),
                    obscureText: false,
                    controller: phoneController,
                  ),
                  CustomTextField(
                    labelText: "Mot de passe",
                    prefixIcon: const Icon(Icons.lock),
                    obscureText: true,
                    controller: pwdController,
                  ),
                  CustomTextField(
                    labelText: "Confirmez le mot de passe",
                    prefixIcon: const Icon(Icons.lock),
                    obscureText: true,
                    controller: confirmPwdController,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const home_bailleur(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      fixedSize: const Size(417, 60),
                      backgroundColor: Colors.blueAccent,
                    ),
                    child: const Text(
                      'CREER UN COMPTE',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
