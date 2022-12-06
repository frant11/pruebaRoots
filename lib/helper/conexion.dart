import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_prueba/paginas/login.dart';

class Conexion extends StatefulWidget {
  const Conexion({super.key});

  @override
  State<Conexion> createState() => _ConexionState();
}

class _ConexionState extends State<Conexion> {
  Future<FirebaseApp> _initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _initializeFirebase(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Login();
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
