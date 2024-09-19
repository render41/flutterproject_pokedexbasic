import 'package:flutter/material.dart';
import 'package:pokeflutter_basic/app_base/extra_functions/extra_functions.dart';
import 'package:pokeflutter_basic/app_base/model/data/api_data.dart';
import 'package:pokeflutter_basic/app_base/model/data/pokemon_data.dart';

class PokemonDetailsView extends StatelessWidget {
  final PokemonData pokemon;

  const PokemonDetailsView({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) => Scaffold(appBar: appBar, body: body);

  AppBar get appBar {
    return AppBar(
      title: Text(capitalizeFirstLetter(pokemon.namePokemon)),
      titleTextStyle: const TextStyle(
        letterSpacing: 1,
        fontWeight: FontWeight.w900,
        fontSize: 24,
      ),
      centerTitle: true,
      backgroundColor: Colors.redAccent,
    );
  }

  Widget get body {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          imagePokemon,
          const SizedBox(height: 16),
          namePokemon,
          const SizedBox(height: 8),
        ],
      ),
    );
  }

  Widget get imagePokemon {
    return Image.network(
      '${ApiData().artworkUrl}${pokemon.urlAPI.split("/")[6]}.png',
      height: 200,
    );
  }

  Widget get namePokemon {
    return Text(
      capitalizeFirstLetter(pokemon.namePokemon),
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
