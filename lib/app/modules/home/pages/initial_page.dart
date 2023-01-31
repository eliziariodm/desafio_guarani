import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/ui/app_colors.dart';
import '../../../core/ui/app_text_styles.dart';
import '../../../models/pokemons_model.dart';
import '../home_controller.dart';
import '../widgets/custom_pokemon_container_widget.dart';

class InitialPage extends StatelessWidget {
  const InitialPage({super.key});

  @override
  Widget build(BuildContext context) {
    final homeController = Get.find<HomeController>();

    return LayoutBuilder(
      builder: (context, constraints) => SizedBox(
        height: constraints.maxHeight,
        width: constraints.maxWidth,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.fromLTRB(14, 10, 14, 10),
              child: Text(
                'Lista de Pokémons',
                style: AppTextStyles.textBold16,
              ),
            ),
            Obx(
              () => SizedBox(
                height: constraints.maxHeight * 0.91,
                child: ListView.builder(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  shrinkWrap: true,
                  controller: homeController.scrollController,
                  itemCount: homeController.pokemonList.length + 1,
                  itemBuilder: ((context, index) {
                    if (index < homeController.pokemonList.length) {
                      PokemonsModel pokemons =
                          homeController.pokemonList[index];
                      if (homeController.pokemonList.length > 1 &&
                          homeController.pokemonList.length - 1 == index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CustomPokemonContainerWidget(
                            name: pokemons.name,
                            // svg: ,
                          ),
                        );
                      } else if (index == 0) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CustomPokemonContainerWidget(
                            name: pokemons.name,
                            // svg: ,
                          ),
                        );
                      } else {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CustomPokemonContainerWidget(
                            name: pokemons.name,
                            // svg: ,
                          ),
                        );
                      }
                    } else {
                      return const Padding(
                        padding: EdgeInsets.only(top: 22),
                        child: Center(
                          child: CircularProgressIndicator(
                            color: AppColors.primary,
                          ),
                        ),
                      );
                    }
                  }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
