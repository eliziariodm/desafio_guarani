import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/ui/app_colors.dart';
import '../../../../core/ui/app_text_styles.dart';
import '../../../../infra/models/pokemons_id_model.dart';
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
                'Pokemon List',
                style: AppTextStyles.textBold18,
              ),
            ),
            Obx(
              () => SizedBox(
                height: constraints.maxHeight * 0.899,
                child: RefreshIndicator(
                  onRefresh: () {
                    return Future.delayed(
                      const Duration(seconds: 1),
                      () => homeController.updateList(),
                    );
                  },
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    shrinkWrap: true,
                    controller: homeController.scrollController,
                    itemCount: homeController.pokemonsIdList.length + 1,
                    itemBuilder: ((context, index) {
                      if (index < homeController.pokemonsIdList.length) {
                        PokemonsIdModel pokemonsId =
                            homeController.pokemonsIdList[index];

                        if (homeController.pokemonsIdList.length > 1 &&
                            homeController.pokemonsIdList.length - 1 == index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CustomPokemonContainerWidget(
                              pokemonsId: pokemonsId,
                            ),
                          );
                        } else if (index == 0) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CustomPokemonContainerWidget(
                              pokemonsId: pokemonsId,
                            ),
                          );
                        } else {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CustomPokemonContainerWidget(
                              pokemonsId: pokemonsId,
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
            ),
          ],
        ),
      ),
    );
  }
}
