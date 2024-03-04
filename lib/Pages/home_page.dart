import 'dart:ui';

import 'package:flutter/material.dart';


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(

        children: [
          Stack(
            children: [
              // Background image
              Container(
                height: MediaQuery.of(context).size.height * 2.5 / 4,
                decoration: const BoxDecoration(
                  image: DecorationImage(image: AssetImage('assets/images/house.jpeg'),fit: BoxFit.cover,),


                  ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                height: 500, // Height of the gradient
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 0.0,sigmaY: 0.0),
                  child: Container(

                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [

                          Colors.transparent,
                          Colors.white,
                        ],
                      ),
                    ),
                  ),

                ),
              ),




            ],
          ),
          const SizedBox(height: 15,),
          const Text("YOUR DREAM SPACE", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),textAlign:TextAlign.center ),
          const SizedBox(height: 25,),
          const Text("Find your perfect dream space with just few clics!", style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),),


          Padding(
            padding: const EdgeInsets.all(100.0),
            child: ElevatedButton(onPressed: () {

            },style:  ElevatedButton.styleFrom(
              backgroundColor: Colors.blueAccent,

              fixedSize: const Size(200, 50),
              padding: const EdgeInsets.all(16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ), child: const Text("LOOK AT", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontSize: 16),),),
          )
        ],
      ),

    );
  }
}
