import 'package:flutter/material.dart';
import 'package:pokeflutter_basic/app_base/extra_functions/extra_functions.dart';
import 'package:pokeflutter_basic/app_base/model/data/api_data.dart';
import 'package:pokeflutter_basic/app_base/model/data/pokemon_data.dart';

class PokemonCard extends StatelessWidget {
  final PokemonData pokemon;
  final String imageFormat = '.png';

  const PokemonCard({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(
            '${ApiData().artworkUrl}${pokemon.urlAPI.split("/")[6]}$imageFormat',
            height: 100,
          ),
          const SizedBox(height: 8),
          Text(
            capitalizeFirstLetter(pokemon.namePokemon),
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}