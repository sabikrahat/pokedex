import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/api/pokedex_api.dart';
import 'package:pokedex/helpers/constants/constants.dart';
import 'package:pokedex/helpers/size_config/size_config.dart';
import 'package:pokedex/model/pokemon.dart';
import 'package:swipe_deck/swipe_deck.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokedex',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<List<Pokemon>> getPokemons() async {
    PokemonModel pokemonModel = await getValue();
    return pokemonModel.pokemon;
  }

  @override
  Widget build(BuildContext context) {
    ScreenSize().init(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokedex'),
      ),
      body: StreamBuilder<List<Pokemon>>(
        stream: getPokemons().asStream(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return Column(
              mainAxisAlignment: mainCenter,
              mainAxisSize: mainMin,
              children: [
                SizedBox(height: kColPadding * 2),
                const Text(
                  'P O K E  D E X',
                  style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.w700,
                    fontSize: kFontSize + 10,
                  ),
                ),
                SizedBox(height: kColPadding * 2),
                SwipeDeck(
                  startIndex: (snapshot.data!.length) ~/ 2,
                  emptyIndicator:
                      const Center(child: CircularProgressIndicator()),
                  widgets: List.generate(
                    snapshot.data!.length,
                    (index) => Container(
                      decoration: BoxDecoration(
                        color: Colors
                            .primaries[
                                Random().nextInt(Colors.primaries.length)]
                            .shade200,
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      height: ScreenSize.height * 0.8,
                      width: ScreenSize.width * 0.7,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: mainCenter,
                          mainAxisSize: mainMin,
                          children: [
                            CachedNetworkImage(
                              imageUrl: snapshot.data![index].img!,
                              placeholder: (context, url) =>
                                  const CircularProgressIndicator(),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                              width: 100.0,
                              height: 100.0,
                              fit: BoxFit.fill,
                            ),
                            SizedBox(height: kColPadding),
                            Text(
                              snapshot.data![index].name!,
                              style: const TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.w500,
                                fontSize: kFontSize + 5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const Spacer(),
              ],
            );
          }
        },
      ),
    );
  }
}
