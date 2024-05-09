import 'package:contacts_exos/Constants/constants.dart';
import 'package:flutter/material.dart';

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bailleur"),
      ),
      body: Center(
        child: Text(
          "La page est indisponible pour des raisons de maintenance.",
          style: TextStyle(
            color: Constants.violetIris,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
