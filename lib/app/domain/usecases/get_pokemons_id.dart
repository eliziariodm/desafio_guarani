import '../entities/pokemons_id.dart';
import '../repositories/pokemons_repository.dart';

abstract class GetPokemonsId {
  Future<PokemonsId> call(int id);
}

class GetPokemonsIdImpl implements GetPokemonsId {
  final PokemonsRepository pokemonsRepository;

  GetPokemonsIdImpl(this.pokemonsRepository);

  @override
  Future<PokemonsId> call(int id) async {
    return pokemonsRepository.getPokemonsId(id);
  }
}
