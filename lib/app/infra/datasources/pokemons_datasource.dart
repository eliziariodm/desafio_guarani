import '../models/pokemons_id_model.dart';
import '../models/pokemons_model.dart';

abstract class PokemonsDatasource {
  Future<List<PokemonsModel>> getPokemonsDatasource({
    int limit = 5,
    int offset = 0,
  });

  Future<PokemonsIdModel> getPokemonsIdDatasource(int id);
}
