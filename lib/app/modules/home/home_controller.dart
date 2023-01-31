import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/pokemons_model.dart';
import '../../repositories/pokemons_repository.dart';

class HomeController extends GetxController {
  RxInt selectedIndex = 0.obs;

  final pokemonsRepository = PokemonsRepository();
  RxList<PokemonsModel> pokemonList = <PokemonsModel>[].obs;

  final scrollController = ScrollController();
  RxBool loadingInfiniteScroll = false.obs;
  RxInt pageNumber = 0.obs;

  @override
  onInit() async {
    await getPokemon();
    scrollController.addListener(() async {
      if (scrollController.position.maxScrollExtent ==
          scrollController.offset) {
        loadingInfiniteScroll.value = true;
        pageNumber.value = pageNumber.value + 5;
        await getPagination(
          page: pageNumber.value,
        );
        loadingInfiniteScroll.value = false;
      }
    });
    super.onInit();
  }

  onItemTapped(int index) {
    selectedIndex.value = index;
  }

  getPokemon() async {
    pokemonList.value = await pokemonsRepository.getPokemons();
  }

  Future<void> getPagination({required int page}) async {
    final pokemons =
        await pokemonsRepository.getPokemons(limit: page, offset: page);
    final auxList = <PokemonsModel>[];
    for (PokemonsModel pokemon in pokemons) {
      auxList.add(pokemon);
    }
    pokemonList.addAll(auxList);
  }
}
