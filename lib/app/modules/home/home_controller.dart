import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../../core/hive/pokemon_hive_adapter.dart';
import '../../models/pokemons_id_model.dart';
import '../../models/pokemons_model.dart';
import '../../repositories/pokemons_repository.dart';

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

  late Box box;
  List<PokemonsIdModel> adapterList = <PokemonsIdModel>[];

  @override
  onInit() async {
    super.onInit();
    Hive.registerAdapter(PokemonHiveAdapter());
    box = await Hive.openBox<PokemonsIdModel>('preferences');

    await getPokemonsController();

    // await readyFavorites();

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

  // readyFavorites() {
  //   box.keys.forEach((pokemons) async {
  //     PokemonsIdModel pokemonsIdModel = await box.get(pokemons);
  //     adapterList.add(pokemonsIdModel);

  //     log('lista de ready: $adapterList');
  //   });
  // }

  addFavorite() {
    box.get('favorite') ?? '';
    favoriteList.value = pokemonsIdList.where((pokemons) {
      box.put('favorite', pokemons);
      log('put ${box.get('favorite')}');

      return pokemons.favorite == true;
    }).toList();

    pokemonsIdList.refresh();
  }

  // addFavorite() async {
  //   pokemonsIdList.forEach((pokemon) {
  //     if (!adapterList.any((p) => p.favorite == pokemon.favorite)) {
  //       favoriteList.add(pokemon);
  //       log('favorites: $favoriteList');

  //       box.put(pokemon.favorite, pokemon);
  //       log('put ${box.get(pokemon)}');
  //     }
  //   });

  //   pokemonsIdList.refresh();
  // }

  removeFavorite(PokemonsIdModel pokemonsIdModel) {
    favoriteList.remove(pokemonsIdModel);
    pokemonsIdList.map((pokemons) {
      if (pokemonsIdModel.name == pokemons.name) {
        pokemons.favorite = false;
      }
    }).toList();
    pokemonsIdList.refresh();
  }
}
