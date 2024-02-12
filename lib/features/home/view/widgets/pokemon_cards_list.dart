import 'package:flutter/material.dart';
import 'package:pokeflutter_basic/app_base/model/data/pokemon_data.dart';
import 'package:pokeflutter_basic/features/home/view/widgets/pokemon_card.dart';
import 'package:pokeflutter_basic/features/pokemon_details/view/pokemon_details_view.dart';

class PokemonCardsList extends StatelessWidget {
  final List<PokemonData> pokemonList;

  const PokemonCardsList({super.key, required this.pokemonList});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 1,
      ),
      padding: const EdgeInsets.all(12),
      itemCount: pokemonList.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PokemonDetailsView(pokemon: pokemonList[index]),
              ),
            );
          },
          child: PokemonCard(pokemon: pokemonList[index]),
        );
      },
    );
  }
}
