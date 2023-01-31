import 'package:dio/dio.dart';

import '../models/details_pokemons_model.dart';
import '../models/pokemons_model.dart';

class PokemonsRepository {
  final dio = Dio();

  Future<List<PokemonsModel>> getPokemons({
    int limit = 5,
    int offset = 0,
  }) async {
    try {
      final response = await dio
          .get('https://pokeapi.co/api/v2/pokemon?limit=$limit&offset=$offset');

      var result = response.data['results'] as List;

      var listPokemons =
          result.map((element) => PokemonsModel.fromMap(element)).toList();

      return listPokemons;
    } on DioError {
      throw Exception();
    }
  }

  Future<List<DetailsPokemonsModel>> getDetailsPokemons(int id) async {
    try {
      final response = await dio.get('https://pokeapi.co/api/v2/pokemon/$id');

      var result = response.data['sprites']['other']['dream_world'] as List;

      var listDetailsPokemons = result
          .map((element) => DetailsPokemonsModel.fromMap(element))
          .toList();

      return listDetailsPokemons;
    } on DioError {
      throw Exception();
    }
  }
}
