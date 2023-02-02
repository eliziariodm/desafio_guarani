import 'package:dartz/dartz.dart';
import 'package:desafio_guarani/app/domain/entities/pokemons.dart';
import 'package:desafio_guarani/app/domain/repositories/pokemons_repository.dart';
import 'package:desafio_guarani/app/domain/usecases/get_pokemons.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class PokemonsRepositoryMock extends Mock implements PokemonsRepository {}

main() {
  final repository = PokemonsRepositoryMock();

  final usecase = GetPokemonsImpl(repository);

  test("deve retornar uma lista de pokemons", () async {
    when(repository.getPokemons())
        .thenAnswer((_) async => const Right(<Pokemons>[]));

    final result = await usecase();
    expect(result, isA<List<Pokemons>>());
  });

  test("deve retornar um erro caso", () async {
    when(repository.getPokemons()).thenThrow((_) async => Exception());

    final result = await usecase();
    expect(result.isLeft(), true);
  });
}
