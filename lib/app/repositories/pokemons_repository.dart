import 'package:dio/dio.dart';

import '../models/pokemons_model.dart';

class PokemonsRepository {
  Future<List<PokemonsModel>> getPokemons({
    int limit = 5,
    int offset = 0,
  }) async {
    try {
      final response = await Dio()
          .get('https://pokeapi.co/api/v2/pokemon?limit=$limit&offset=$offset');

      var result = response.data['results'] as List;

      List<PokemonsModel> lista = [];

      for (Map<String, dynamic> element in result) {
        lista.add(PokemonsModel.fromMap(element));
      }

      return lista;
    } on DioError {
      throw Exception();
    }
  }

  // Future<List<PokemonsModel>> getSvgPokemons(int id) async {
  //   try {
  //     final response = await Dio().get(
  //         'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/dream-world/$id.svg');

  //     var result = response.data['results'] as List;

  //     List<PokemonsModel> lista = [];

  //     for (Map<String, dynamic> element in result) {
  //       lista.add(PokemonsModel.fromMap(element));
  //     }

  //     return lista;
  //   } on DioError {
  //     throw Exception();
  //   }
  // }
}
