import 'package:dartz/dartz.dart';

import '../entities/pokemons_id.dart';
import '../errors/error_handling.dart';
import '../repositories/pokemons_repository.dart';

abstract class GetPokemonsId {
  Future<Either<ErrorHandlingPokemons, PokemonsId>> call(int id);
}

class GetPokemonsIdImpl implements GetPokemonsId {
  final PokemonsRepository pokemonsRepository;

  GetPokemonsIdImpl(this.pokemonsRepository);

  @override
  Future<Either<ErrorHandlingPokemons, PokemonsId>> call(int id) async {
    if (id == 0) {
      return Left(ErrorForZero());
    }

    return pokemonsRepository.getPokemonsId(id);
  }
}
