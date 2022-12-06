import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Favoritos extends StatefulWidget {
  final pokemonDetalle;
  final Color color;
  final int idpokemon;

  const Favoritos(
      {super.key,
      required this.pokemonDetalle,
      required this.color,
      required this.idpokemon});

  @override
  State<Favoritos> createState() => _FavoritosState();
}

class _FavoritosState extends State<Favoritos> {
  final CollectionReference _favoritos =
      FirebaseFirestore.instance.collection('favoritos');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: const Center(
          child: Text(
            "Favoritos",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.yellowAccent,
            ),
          ),
        ),
      ),
      //cuerpo de la pagina
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 184, 200, 1),
            Color.fromARGB(255, 36, 7, 204),
            Color.fromARGB(198, 160, 185, 2),
            Color.fromARGB(255, 40, 0, 237),
          ],
        )),
        child: StreamBuilder(
          stream: _favoritos.snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
            if (streamSnapshot.hasData) {
              return ListView.builder(
                itemCount: streamSnapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  final DocumentSnapshot documentSnapshot =
                      streamSnapshot.data!.docs[index];
                  return Card(
                    color: Colors.blueAccent,
                    margin: const EdgeInsets.all(10),
                    child: ListTile(
                      title: Text(documentSnapshot['nombrePokemon'].toString()),
                      subtitle: Text(documentSnapshot['tipo'].toString()),
                      trailing: SizedBox(
                        width: 50,
                        child: Row(
                          children: [
                            IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () => _delete(documentSnapshot.id),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            }
            return const Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.blueAccent,
              ),
            );
          },
        ),
      ),
    );
  }

  //Metodo para eliminar de favoritos
  Future<void> _delete(String pokeId) async {
    await _favoritos.doc(pokeId).delete();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('El pokemon fue eliminado correctamente'),
      ),
    );
  }
}
