import 'dart:convert';
import 'package:http/http.dart' as http;

class Pokemon {
  final int id;
  final String name;
  final String? spriteUrl;

  Pokemon({required this.id, required this.name, this.spriteUrl});
}

class PokeApiService {
  static const _baseUrl = 'https://pokeapi.co/api/v2';

  Future<Pokemon> fetchPokemon(String nameOrId) async {
    final url = Uri.parse('$_baseUrl/pokemon/${nameOrId.toLowerCase()}');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return Pokemon(
        id: data['id'],
        name: data['name'],
        spriteUrl: data['sprites']['front_default'],
      );
    } else {
      throw Exception('Error al obtener el Pokémon: ${response.statusCode}');
    }
  }
}
