import 'dart:ui' show ImageFilter;

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'page_inscription.dart';

class lessor_or_tenant_Page extends StatelessWidget {
  lessor_or_tenant_Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Builder(builder: (context) {
        return Scaffold(
          body: Stack(
            children: [
              // Blurred background image
              Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/home1.jpeg'),
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
                padding: EdgeInsets.only(top: 200.0, left: 20.0),
                child: Text(
                  "S'INSCRIRE",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                      color: Colors.white),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 260, left: 20),
                child: Text(
                  "Choisissez le type d'utilisateur que vous souhaitez devenir : ",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),

              // Centered content
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Top button
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Inscription(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        fixedSize: const Size(400, 50),
                        backgroundColor: Colors.blueAccent,
                      ),
                      child: const Text(
                        'Bailleur',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),

                    // Divider with text
                    const SizedBox(height: 20),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child: Divider(
                            color: Colors.white,
                            thickness: 1,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            'ou',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            color: Colors.white,
                            thickness: 1,
                          ),
                        ),
                      ],
                    ),

                    // Bottom button
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Inscription(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        fixedSize: const Size(400, 50),
                        backgroundColor: Colors.blueAccent,
                      ),
                      child: const Text(
                        'Locataire',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),

                    // Bottom text
                    const SizedBox(height: 50),
                    RichText(
                      text: TextSpan(
                        text: 'J\'ai déjà un compte/',
                        style: const TextStyle(color: Colors.white),
                        children: [
                          TextSpan(
                            text: 'Se connecter',
                            style: const TextStyle(
                                color: Colors.blueAccent,
                                decoration: TextDecoration.underline),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                // Navigate to the login page
                              },
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
