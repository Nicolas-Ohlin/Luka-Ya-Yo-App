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
                height: MediaQuery.of(context).size.height * 3 / 4,
                decoration: const BoxDecoration(
                  image: DecorationImage(image: AssetImage('assets/images/house.jpeg'),fit: BoxFit.cover,),


                  ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                height: 100, // Height of the gradient
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
          SizedBox(height: 25,),
          Text("YOUR DREAM SPACE", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),textAlign:TextAlign.center ),
          SizedBox(height: 25,),
          Text("Find your perfect dream space with just few clics!"),
          SizedBox(height: 25,),

          ElevatedButton(onPressed: () {

          }, child: Text("LOOK AT"),)
        ],
      ),

    );
  }
}
