import 'package:desafio_guarani/app/domain/errors/error_handling.dart';
import 'package:desafio_guarani/app/external/datasources/poke_api_datasource.dart';
import 'package:desafio_guarani/app/infra/models/pokemons_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class DioMock extends Mock implements Dio {}

main() {
  final dio = Dio();

  final datasource = PokeApiDatasource();

  test("deve retornar um pokemons pelo id no Dio", () async {
    when(dio.get('')).thenAnswer(
      (_) async => Response(
        data: {},
        statusCode: 200,
        requestOptions: RequestOptions(method: 'GET', path: ''),
      ),
    );

    final result = await datasource.getPokemonsIdDatasource(1);
    expect(result, completes);
  });

  test("deve retornar um erro caso o id no Dio venha igual a 0", () async {
    when(datasource.getPokemonsIdDatasource(0))
        .thenThrow((_) async => ErrorForZero());

    final result = await datasource.getPokemonsIdDatasource(0);
    expect(result, true);
  });

  test("deve retornar uma lista de pokemons do Dio", () async {
    when(datasource.getPokemonsDatasource())
        .thenAnswer((_) async => <PokemonsModel>[]);

    final result = await datasource.getPokemonsDatasource();
    expect(result, completes);
  });

  test("deve retornar um erro caso a lista esteja vazia no Dio", () async {
    when(datasource.getPokemonsDatasource())
        .thenThrow((_) async => Exception());

    final result = await datasource.getPokemonsDatasource();
    expect(result, true);
  });
}
