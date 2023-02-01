import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/pokemons_id_model.dart';
import '../../models/pokemons_model.dart';
import '../../repositories/pokemons_repository.dart';
import '../splash/splash_controller.dart';

class HomeController extends GetxController {
  RxInt selectedIndex = 0.obs;

  final pokemonsRepository = PokemonsRepository();
  RxList<PokemonsModel> pokemonsList = <PokemonsModel>[].obs;
  Rx<PokemonsIdModel> pokemonsId = PokemonsIdModel().obs;
  RxList<PokemonsIdModel> pokemonsIdList = <PokemonsIdModel>[].obs;

  final scrollController = ScrollController();
  RxInt offset = 1.obs;
  RxInt limit = 5.obs;

  RxList<PokemonsIdModel> favoriteList = <PokemonsIdModel>[].obs;

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

  getPokemonsController() async {
    pokemonsList.value = await pokemonsRepository.getPokemons();

    for (var pokemon = 1; pokemon <= pokemonsList.length; pokemon++) {
      final ids = await getPokemonsIdController(id: pokemon);

      final auxList = <PokemonsIdModel>[ids];

      pokemonsIdList.addAll(auxList);
    }
  }

  Future<PokemonsIdModel> getPokemonsIdController({required int id}) async {
    return pokemonsId.value = await pokemonsRepository.getPokemonsId(id);
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
      log('pokemon: $pokemons');

      PokemonsIdModel pokemonsIdModel = splashController.box.get(pokemons);
      favoriteList.add(pokemonsIdModel);
    }
  }

  addFavorite() {
    favoriteList.value =
        pokemonsIdList.where((pokemons) => pokemons.favorite == true).toList();

    favoriteList.where(
      (pokemons) {
        if (pokemons.favorite == true) {
          for (PokemonsIdModel pokemon in favoriteList) {
            splashController.box.put(pokemon.name, pokemon);
            log('put ${splashController.box.get(pokemon.name)}');
          }
        }
        return pokemons.favorite == true;
      },
    ).toList();
  }

  removeFavorite(PokemonsIdModel pokemonsIdModel) {
    favoriteList.remove(pokemonsIdModel);

    pokemonsIdList.map((pokemons) {
      splashController.box.delete(pokemonsIdModel.name);
      log('delete ${splashController.box.get(pokemonsIdModel.name)}');

      if (pokemonsIdModel.name == pokemons.name) {
        pokemons.favorite = false;
      }
    }).toList();

    pokemonsIdList.refresh();
  }
}
