import 'package:dartz/dartz.dart';
import 'package:desafio_guarani/app/domain/entities/pokemons_id.dart';
import 'package:desafio_guarani/app/domain/errors/error_handling.dart';
import 'package:desafio_guarani/app/domain/repositories/pokemons_repository.dart';
import 'package:desafio_guarani/app/domain/usecases/get_pokemons_id.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class PokemonsRepositoryMock extends Mock implements PokemonsRepository {}

main() {
  final repository = PokemonsRepositoryMock();

  final usecase = GetPokemonsIdImpl(repository);

  test("deve retornar um pokemons pelo id", () async {
    when(repository.getPokemonsId(1))
        .thenAnswer((_) async => Right(PokemonsId()));

    final result = await usecase(1);
    expect(result, isA<PokemonsId>());
  });

  test("deve retornar um erro caso o id venha igual a 0", () async {
    when(repository.getPokemonsId(0))
        .thenThrow((_) async => Left(ErrorForZero()));

    final result = await usecase(0);
    expect(result.isLeft(), true);
  });
}
