import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_prueba/helper/conexion.dart';
import 'package:pokedex_prueba/helper/helper.dart';
import 'package:pokedex_prueba/paginas/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Prueba());
}

class Prueba extends StatefulWidget {
  const Prueba({super.key});

  @override
  State<Prueba> createState() => _PruebaState();
}

class _PruebaState extends State<Prueba> {
  bool _isSignedIn = false;
  @override
  void initState() {
    super.initState();
    getUserLoggedInStatus();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.redAccent,
        scaffoldBackgroundColor: Colors.white,
      ),
      debugShowCheckedModeBanner: false,
      title: 'Prueba',
      home: _isSignedIn ? Home() : const Conexion(),
    );
  }

  getUserLoggedInStatus() async {
    await Helper_funciones.getUserLoggedInStatus().then((value) {
      if (value != null) {
        _isSignedIn = value;
      }
    });
  }
}
