class PokemonData {
  final String namePokemon;
  final String urlAPI;

  PokemonData({required this.namePokemon, required this.urlAPI});

  factory PokemonData.fromJson(Map<String, dynamic> json) {
    return PokemonData(
      namePokemon: json['name'],
      urlAPI: json['url'],
    );
  }
}
