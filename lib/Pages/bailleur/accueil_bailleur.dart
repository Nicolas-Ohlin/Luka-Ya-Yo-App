import 'package:contacts_exos/Constants/constants.dart';
import 'package:flutter/material.dart';

import '../../Components/text.dart';

class page_bailleur extends StatefulWidget {
  const page_bailleur({super.key});

  @override
  State<page_bailleur> createState() => _page_bailleurState();
}

class _page_bailleurState extends State<page_bailleur> {
  @override
  Widget build(BuildContext context) {
    final height =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(bottom: 10, right: 10, left: 10, top: 30),
            child: Container(
              padding: EdgeInsets.all(20),
              height: height * 0.2,
              decoration: BoxDecoration(
                color: Constants.royalBlue,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage(""),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Vladimir Poutine",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      text_icon(
                        icon: Icons.mail,
                        text: "vladimir.poutine@gmail.com",
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      text_icon(
                        icon: Icons.phone,
                        text: "+243 999999900",
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              "Mes annonces",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Constants.royalBlue,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: height * 0.61,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Constants.royalBlue.withOpacity(0.2),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
