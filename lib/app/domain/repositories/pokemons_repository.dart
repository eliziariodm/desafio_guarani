import '../entities/pokemons.dart';
import '../entities/pokemons_id.dart';

abstract class PokemonsRepository {
  Future<PokemonsId> getPokemonsId(int id);

  Future<List<Pokemons>> getPokemons({int limit = 5, int offset = 0});
}
