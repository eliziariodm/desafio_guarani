import 'package:desafio_guarani/app/domain/entities/pokemons.dart';
import 'package:desafio_guarani/app/domain/entities/pokemons_id.dart';
import 'package:desafio_guarani/app/domain/errors/error_handling.dart';
import 'package:desafio_guarani/app/infra/datasources/pokemons_datasource.dart';
import 'package:desafio_guarani/app/infra/models/pokemons_id_model.dart';
import 'package:desafio_guarani/app/infra/models/pokemons_model.dart';
import 'package:desafio_guarani/app/infra/repositories/pokemons_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class PokemonsDatasourceMock extends Mock implements PokemonsDatasource {}

main() {
  final datasource = PokemonsDatasourceMock();

  final repository = PokemonsRepositoryImpl(datasource);

  test("deve retornar um pokemons pelo id no datasource", () async {
    when(datasource.getPokemonsIdDatasource(1))
        .thenAnswer((_) async => PokemonsIdModel());

    final result = await repository.getPokemonsId(1);
    expect(result, isA<PokemonsId>());
  });

  test("deve retornar um erro caso o id no datasource venha igual a 0",
      () async {
    when(datasource.getPokemonsIdDatasource(0))
        .thenThrow((_) async => ErrorForZero());

    final result = await repository.getPokemonsId(0);
    expect(result.isLeft(), true);
  });

  test("deve retornar uma lista de pokemons do datasource", () async {
    when(datasource.getPokemonsDatasource())
        .thenAnswer((_) async => <PokemonsModel>[]);

    final result = await repository.getPokemons();
    expect(result, isA<List<Pokemons>>());
  });

  test("deve retornar um erro caso a lista esteja vazia no datasource",
      () async {
    when(datasource.getPokemonsDatasource())
        .thenThrow((_) async => Exception());

    final result = await repository.getPokemons();
    expect(result.isLeft(), true);
  });
}
