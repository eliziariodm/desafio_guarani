import 'dart:developer';

import '../../domain/entities/pokemons.dart';
import '../../domain/entities/pokemons_id.dart';
import '../../domain/repositories/pokemons_repository.dart';
import '../datasources/pokemons_datasource.dart';

class PokemonsRepositoryImpl implements PokemonsRepository {
  final PokemonsDatasource pokemonsDatasource;

  PokemonsRepositoryImpl(this.pokemonsDatasource);

  @override
  Future<List<Pokemons>> getPokemons({int limit = 5, int offset = 0}) async {
    try {
      final result = await pokemonsDatasource.getPokemonsDatasource();

      return result;
    } catch (e) {
      log('Pokemons: Vindo do Repository Impl $e');
      throw Exception();
    }
  }

  @override
  Future<PokemonsId> getPokemonsId(int id) async {
    try {
      final result = await pokemonsDatasource.getPokemonsIdDatasource(id);

      return result;
    } catch (e) {
      log('PokemonsId: Vindo do Repository Impl $e');
      throw Exception();
    }
  }
}
