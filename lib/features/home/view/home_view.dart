import 'package:flutter/material.dart';

import 'package:pokeflutter_basic/app_base/model/data/pokemon_data.dart';
import 'package:pokeflutter_basic/features/home/controller/pokemon_controller.dart';
import 'package:pokeflutter_basic/features/home/view/widgets/pokemon_cards_list.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late Future<List<PokemonData>> _pokemonList;
  final PokemonController _pokemonController = PokemonController();

  @override
  void initState() {
    super.initState();
    _pokemonList = _pokemonController.fetchPokemonList(151);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: body,
    );
  }

  AppBar get appBar {
    return AppBar(
      title: const Text('Pokedex'),
      titleTextStyle: const TextStyle(fontWeight: FontWeight.w900, fontSize: 28),
      centerTitle: true,
      backgroundColor: Colors.redAccent,
    );
  }

  Widget get body {
    return Center(
      child: FutureBuilder<List<PokemonData>>(
        future: _pokemonList,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return PokemonCardsList(pokemonList: snapshot.data!);
          }
        },
      ),
    );
  }
}
