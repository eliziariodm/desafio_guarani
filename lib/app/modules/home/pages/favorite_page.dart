import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../models/pokemons_id_model.dart';
import '../home_controller.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    final homeController = Get.find<HomeController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Favorite',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Obx(
        () => Container(
          color: Colors.white,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: homeController.favoriteList.isEmpty
              ? const Center(
                  child: Text('Add your favorite Pokemons'),
                )
              : ListView.builder(
                  itemCount: homeController.favoriteList.length,
                  itemBuilder: (context, index) {
                    PokemonsIdModel favoritesPokemonsId =
                        homeController.favoriteList[index];

                    return Card(
                      color: Colors.white,
                      margin: const EdgeInsets.all(40),
                      child: ListTile(
                        title: Padding(
                          padding: const EdgeInsets.all(5),
                          child: Text(
                            favoritesPokemonsId.name ?? '',
                            style: const TextStyle(fontSize: 16),
                          ),
                        ),
                        subtitle: Padding(
                          padding: const EdgeInsets.all(5),
                          child: SvgPicture.network(
                            favoritesPokemonsId.svg ?? '',
                          ),
                        ),
                        trailing: Container(
                          width: MediaQuery.of(context).size.width * 0.07,
                          alignment: Alignment.centerRight,
                          child: IconButton(
                            splashRadius: 30,
                            color: const Color(0xFF141E26),
                            iconSize: 35,
                            icon: favoritesPokemonsId.favorite
                                ? const Icon(Icons.favorite, color: Colors.red)
                                : const Icon(Icons.favorite_border),
                            onPressed: () {
                              homeController
                                  .removeFavorite(favoritesPokemonsId);
                            },
                          ),
                        ),
                      ),
                    );
                  },
                ),
        ),
      ),
    );
  }
}
