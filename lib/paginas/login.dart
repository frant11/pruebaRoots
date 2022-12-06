import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:pokedex_prueba/paginas/home.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _loginState();
}

class _loginState extends State<Login> {
  static Future<User?> loginUsingEmailPassword(
      {required String email,
      required String password,
      required BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      user = userCredential.user!;
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        print("Ningun usuario encontrado para el email");
      }
    }
    return user;
  }

  final formKeys = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    TextEditingController _emailController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();
    String email = "";
    String password = "";
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 80),
          child: Form(
            key: formKeys,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Pokedex',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Iniciar Sesion',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Image.network(
                    "https://cdn02.plentymarkets.com/8g1j1xorqt9q/item/images/355366/middle/355366-Pokemon-8-Partyteller-22-8cm.jpg?w50"),

                SizedBox(
                  height: 15,
                ),
                //Textbox para ingresar el correo.
                TextField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: "Email",
                    prefixIcon: Icon(
                      Icons.email,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                //Textbox para ingresar la contraseña
                TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "Password",
                    prefixIcon: Icon(
                      Icons.lock,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Theme.of(context).primaryColor,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        )),
                    //Boton para validar el ingreso.
                    child: const Text(
                      'Ingresar',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                    onPressed: (() async {
                      if (formKeys.currentState!.validate()) {
                        User? user = await loginUsingEmailPassword(
                            email: _emailController.text,
                            password: _passwordController.text,
                            context: context);
                        if (user != null) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Home(),
                              ));
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Correo o contraseña incorrectos'),
                            ),
                          );
                        }
                      }
                    }),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
