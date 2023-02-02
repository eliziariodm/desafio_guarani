import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../core/ui/app_colors.dart';
import '../../../../core/ui/app_text_styles.dart';
import '../../../../infra/models/pokemons_id_model.dart';
import '../home_controller.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    final homeController = Get.find<HomeController>();

    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) => SizedBox(
          height: constraints.maxHeight,
          width: constraints.maxWidth,
          child: Obx(
            () => Container(
              child: homeController.favoriteList.isEmpty
                  ? const Center(
                      child: Text('Add your favorite Pokemons'),
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      itemCount: homeController.favoriteList.length,
                      itemBuilder: (context, index) {
                        PokemonsIdModel favoritesPokemonsId =
                            homeController.favoriteList[index];

                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 50, vertical: 10),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 5),
                            height: 200,
                            decoration: BoxDecoration(
                              color: AppColors.backgroundDetails,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(5)),
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                  color: AppColors.primary.withOpacity(0.7),
                                  blurRadius: 8,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Flexible(
                                      flex: 1,
                                      child: Text(
                                        favoritesPokemonsId.name
                                                ?.toUpperCase() ??
                                            '',
                                        style: AppTextStyles.textBold18,
                                      ),
                                    ),
                                    const SizedBox(height: 30),
                                    Flexible(
                                      flex: 3,
                                      child: SvgPicture.network(
                                        height: 100,
                                        width: 60,
                                        favoritesPokemonsId.svg ?? '',
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(width: 30),
                                Flexible(
                                  flex: 3,
                                  child: IconButton(
                                    splashRadius: 30,
                                    color: const Color(0xFF141E26),
                                    iconSize: 35,
                                    icon: favoritesPokemonsId.favorite
                                        ? const Icon(Icons.favorite,
                                            color: Colors.red)
                                        : const Icon(Icons.favorite_border),
                                    onPressed: () {
                                      homeController.removeFavorite(
                                          homeController.favoriteList[index]);
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
