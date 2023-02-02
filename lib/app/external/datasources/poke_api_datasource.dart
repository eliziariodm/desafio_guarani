import 'package:dio/dio.dart';

import '../../infra/datasources/pokemons_datasource.dart';
import '../../infra/models/pokemons_id_model.dart';
import '../../infra/models/pokemons_model.dart';

class PokeApiDatasource implements PokemonsDatasource {
  final dio = Dio();

  @override
  Future<List<PokemonsModel>> getPokemonsDatasource({
    int limit = 5,
    int offset = 0,
  }) async {
    final response = await dio
        .get('https://pokeapi.co/api/v2/pokemon?limit=$limit&offset=$offset');

    if (response.statusCode == 200) {
      var result = response.data['results'] as List;

      var listPokemons =
          result.map((element) => PokemonsModel.fromMap(element)).toList();

      return listPokemons;
    } else {
      return throw Exception();
    }
  }

  @override
  Future<PokemonsIdModel> getPokemonsIdDatasource(int id) async {
    final response = await dio.get('https://pokeapi.co/api/v2/pokemon/$id');

    if (response.statusCode == 200) {
      var result = response.data;

      var detailsPokemons = PokemonsIdModel.fromMap(result);

      return detailsPokemons;
    } else {
      throw Exception();
    }
  }
}
