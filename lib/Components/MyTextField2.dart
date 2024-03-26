import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String labelText;
  final Widget prefixIcon;
  final bool obscureText;
  final TextEditingController controller;

  const CustomTextField({
    Key? key,
    required this.labelText,
    required this.prefixIcon,
    required this.obscureText,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: TextFormField(
          controller: controller,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            labelText: labelText,
            labelStyle: const TextStyle(fontSize: 15),
            prefixIcon: prefixIcon,
            prefixIconColor: Colors.blueAccent,
            fillColor: Colors.white,
            filled: true,
          ),
          obscureText: obscureText,
        ),
      ),
    );
  }
}
