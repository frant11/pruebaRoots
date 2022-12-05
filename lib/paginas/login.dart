import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _loginState();
}

class _loginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Padding(
        padding:
            const EdgeInsets.only(top: 260, bottom: 200, right: 100, left: 125),
        child: Container(
          child: Text(
            'Bienvenido',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              color: Colors.amberAccent,
            ),
          ),
        ),
      ),
    );
  }
}
