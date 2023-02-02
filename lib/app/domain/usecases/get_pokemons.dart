import '../entities/pokemons.dart';
import '../repositories/pokemons_repository.dart';

abstract class GetPokemons {
  Future<List<Pokemons>> call({int limit = 5, int offset = 0});
}

class GetPokemonsImpl implements GetPokemons {
  final PokemonsRepository pokemonsRepository;

  GetPokemonsImpl(this.pokemonsRepository);

  @override
  Future<List<Pokemons>> call({int limit = 5, int offset = 0}) async {
    return pokemonsRepository.getPokemons();
  }
}
