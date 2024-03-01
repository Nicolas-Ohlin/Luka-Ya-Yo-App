import 'package:flutter/material.dart';

import '../Components/my_Button.dart';
import '../Components/my_text_field.dart';
import 'package:http/http.dart' as http;

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;
  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late String nom;
  late String email;
  late String passwrd;

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  //sign uo user

  signUp() async {
    String url = "http://192.168.56.1/ClubInfoProject/insert_data.php";
    var response = await http.post(Uri.parse(url), body: {
      "nom": nom,
      "email": email,
      "passwrd": passwrd,
    });
    if (response.body == "Success") {
      print("inscription réussie!");
      //Permet  de vider cette variable quand la connexion a réussi
    } else {
      print("Echec de l'opération");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //Logo
                const Icon(
                  Icons.message,
                  size: 100,
                ),
                //create an account  msg
                const Text(
                  "Let's create an account for you!",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                //email text field
                const SizedBox(height: 25),
                MyTextField(
                  controller: nameController,
                  obscureText: false,
                  hintText: "Username",
                  onChanged: (value) {
                    nom = value;
                  },
                ),
                const SizedBox(height: 25),
                MyTextField(
                  controller: emailController,
                  obscureText: false,
                  hintText: "Email",
                  onChanged: (value) {
                    email = value;
                  },
                ),
                const SizedBox(height: 25),
                MyTextField(
                  controller: passwordController,
                  obscureText: true,
                  hintText: "Password",
                  onChanged: (value) {
                    passwrd = value;
                  },
                ),
                const SizedBox(height: 25),
                //sing up Button
                MyButton(onTap: signUp, text: "Sign Up"),
                //not a member? register now
                const SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already a member?"),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Text(
                        "Login now",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
