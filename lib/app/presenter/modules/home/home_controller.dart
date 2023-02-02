import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../external/datasources/poke_api_datasource.dart';
import '../../../infra/datasources/models/pokemons_id_model.dart';
import '../../../infra/datasources/models/pokemons_model.dart';
import '../splash/splash_controller.dart';

class HomeController extends GetxController {
  RxInt selectedIndex = 0.obs;

  final pokerApiDatasource = PokerApiDatasource();
  RxList<PokemonsModel> pokemonsList = <PokemonsModel>[].obs;
  Rx<PokemonsIdModel> pokemonsId = PokemonsIdModel().obs;
  RxList<PokemonsIdModel> pokemonsIdList = <PokemonsIdModel>[].obs;

  final scrollController = ScrollController();
  RxInt offset = 1.obs;
  RxInt limit = 5.obs;

  RxList<PokemonsIdModel> favoriteList = <PokemonsIdModel>[].obs;
  RxList<PokemonsIdModel> adaptaterList = <PokemonsIdModel>[].obs;

  final SplashController splashController = Get.find();

  @override
  onInit() async {
    super.onInit();

    await getPokemonsController();

    await readyFavorites();

    scrollController.addListener(() async {
      if (scrollController.position.maxScrollExtent ==
          scrollController.offset) {
        offset.value = offset.value + 5;
        limit.value = limit.value + 5;
        await getPagination(
          offset: offset.value,
          limit: limit.value,
        );
      }
    });
  }

  onItemTapped(int index) {
    selectedIndex.value = index;
  }

  Future updateList() async {
    await getPokemonsController();
    await getPagination(
      offset: 1,
      limit: 5,
    );
  }

  getPokemonsController() async {
    pokemonsList.value = await pokerApiDatasource.getPokemonsDatasource();

    for (var pokemon = 1; pokemon <= pokemonsList.length; pokemon++) {
      final ids = await getPokemonsIdController(id: pokemon);

      final auxList = <PokemonsIdModel>[ids];

      pokemonsIdList.addAll(auxList);
    }
  }

  Future<PokemonsIdModel> getPokemonsIdController({required int id}) async {
    return pokemonsId.value =
        await pokerApiDatasource.getPokemonsIdDatasource(id);
  }

  Future<void> getPagination({required int offset, required int limit}) async {
    for (var pokemon = offset; pokemon <= limit; pokemon++) {
      final ids = await getPokemonsIdController(id: pokemon);

      final auxList = <PokemonsIdModel>[ids];

      pokemonsIdList.addAll(auxList);
    }
  }

  readyFavorites() {
    for (var pokemons in splashController.box.keys) {
      PokemonsIdModel pokemonsIdModel = splashController.box.get(pokemons);
      favoriteList.add(pokemonsIdModel);
    }
  }

  addFavorite() {
    adaptaterList.value =
        pokemonsIdList.where((pokemons) => pokemons.favorite == true).toList();

    adaptaterList.where(
      (pokemons) {
        if (pokemons.favorite == true) {
          for (PokemonsIdModel pokemon in adaptaterList) {
            if (!favoriteList.any((p) => p.name == pokemons.name)) {
              splashController.box.put(pokemon.name, pokemon);
              splashController.boxIsTrue.put(pokemon.name, pokemon.favorite);
              favoriteList.add(pokemon);
            }
          }
        }
        return pokemons.favorite == true;
      },
    ).toList();
  }

  removeFavorite(PokemonsIdModel pokemonsIdModel) {
    favoriteList.remove(pokemonsIdModel);

    splashController.box.delete(pokemonsIdModel.name);
    splashController.boxIsTrue.delete(pokemonsIdModel.name);
    pokemonsIdList.map((pokemons) {
      if (pokemonsIdModel.name == pokemons.name) {
        pokemons.favorite = false;
      }
    }).toList();

    pokemonsIdList.refresh();
  }
}
