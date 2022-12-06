import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_prueba/paginas/favoritos.dart';

class DetallePokemon extends StatefulWidget {
  final pokemonDetalle;
  final Color color;
  final int idpokemon;

  const DetallePokemon(
      {super.key,
      required this.pokemonDetalle,
      required this.color,
      required this.idpokemon});

  @override
  State<DetallePokemon> createState() => _DetallePokemonState();
}

class _DetallePokemonState extends State<DetallePokemon> {
  List pokedesk = [];

  @override
  Widget build(BuildContext context) {
    var anchodeta = MediaQuery.of(context).size.width;
    var altodeta = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: widget.color,
      body: Stack(
        alignment: Alignment.center,
        children: [
          //boton para retornar
          Positioned(
            top: 40,
            left: 1,
            child: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
                size: 20,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          //nombre del pokemon
          Positioned(
              top: 80,
              left: 20,
              child: Text(
                widget.pokemonDetalle['name'],
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              )),
          //tipo del pokemon
          Positioned(
            top: 120,
            left: 20,
            child: Container(
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 8.0, right: 8.0, top: 4.0, bottom: 4.0),
                child: Text(
                  widget.pokemonDetalle['type'].join(', '),
                  style: TextStyle(color: Colors.white),
                ),
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                  color: Colors.black26),
            ),
          ),
          //imagen de fondo
          Positioned(
            top: altodeta * 0.18,
            right: -30,
            child: Image.asset(
              'assets/img/pokeball.png',
              height: 200,
              fit: BoxFit.fitHeight,
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: anchodeta,
              height: altodeta * 0.6,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                color: Colors.white,
              ),
              //Ubicación del nombre
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: anchodeta * 0.30,
                            child: Text(
                              "Nombre: ",
                              style: TextStyle(
                                color: Colors.blueGrey,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          Container(
                            width: anchodeta * 0.30,
                            child: Text(
                              widget.pokemonDetalle['name'],
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    //Altura
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: anchodeta * 0.30,
                            child: Text(
                              "Altura: ",
                              style: TextStyle(
                                color: Colors.blueGrey,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          Container(
                            width: anchodeta * 0.30,
                            child: Text(
                              widget.pokemonDetalle['height'],
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    //Peso
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: anchodeta * 0.30,
                            child: Text(
                              "Peso: ",
                              style: TextStyle(
                                color: Colors.blueGrey,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          Container(
                            width: anchodeta * 0.30,
                            child: Text(
                              widget.pokemonDetalle['weight'],
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    //Spawn Time
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: anchodeta * 0.30,
                            child: Text(
                              "Spawn Time: ",
                              style: TextStyle(
                                color: Colors.blueGrey,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          Container(
                            width: anchodeta * 0.30,
                            child: Text(
                              widget.pokemonDetalle['spawn_time'],
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    //weakness
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: anchodeta * 0.30,
                            child: Text(
                              "Weaknesses: ",
                              style: TextStyle(
                                color: Colors.blueGrey,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          Container(
                            child: Text(
                              widget.pokemonDetalle['weaknesses'].join(', '),
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    //Evolucion}
                    Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: anchodeta * 0.30,
                            child: Text(
                              "Evolucion: ",
                              style: TextStyle(
                                color: Colors.blueGrey,
                                fontSize: 18,
                              ),
                            ),
                          ),
                          widget.pokemonDetalle['next_evolution'] != null
                              ? SizedBox(
                                  height: 20,
                                  width: anchodeta * 0.55,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: widget
                                        .pokemonDetalle['next_evolution']
                                        .length,
                                    itemBuilder: ((context, index) {
                                      return Padding(
                                        padding:
                                            const EdgeInsets.only(right: 8.0),
                                        child: Text(
                                            widget.pokemonDetalle[
                                                    'next_evolution'][index]
                                                ['name'],
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold)),
                                      );
                                    }),
                                  ),
                                )
                              : Text(
                                  'Maxima Evolucion',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          //Imagen del pokemon
          Positioned(
            top: (altodeta * 0.18) - 20,
            left: (anchodeta / 2) - 65,
            child: CachedNetworkImage(
              imageUrl: widget.pokemonDetalle['img'],
              height: 240,
              fit: BoxFit.fitHeight,
            ),
          )
        ],
      ),
    );
  }
}
