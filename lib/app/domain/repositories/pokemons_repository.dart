import 'package:dartz/dartz.dart';

import '../entities/pokemons.dart';
import '../entities/pokemons_id.dart';
import '../errors/error_handling.dart';

abstract class PokemonsRepository {
  Future<Either<ErrorHandlingPokemons, PokemonsId>> getPokemonsId(int id);

  Future<Either<ErrorHandlingPokemons, List<Pokemons>>> getPokemons(
      {int limit = 5, int offset = 0});
}
