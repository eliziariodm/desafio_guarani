import 'package:dartz/dartz.dart';

import '../entities/pokemons.dart';
import '../errors/error_handling.dart';
import '../repositories/pokemons_repository.dart';

abstract class GetPokemons {
  Future<Either<ErrorHandlingPokemons, List<Pokemons>>> call(
      {int limit = 5, int offset = 0});
}

class GetPokemonsImpl implements GetPokemons {
  final PokemonsRepository pokemonsRepository;

  GetPokemonsImpl(this.pokemonsRepository);

  @override
  Future<Either<ErrorHandlingPokemons, List<Pokemons>>> call(
      {int limit = 5, int offset = 0}) async {
    return pokemonsRepository.getPokemons();
  }
}
