import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../../core/ui/app_colors.dart';
import '../../../../core/ui/app_images.dart';
import '../../../../core/ui/app_text_styles.dart';
import '../../../../infra/datasources/models/pokemons_id_model.dart';
import '../../splash/splash_controller.dart';
import '../home_controller.dart';
import '../widgets/description_widget.dart';

class DetailsPage extends StatefulWidget {
  final PokemonsIdModel pokemonsIdDetails;

  const DetailsPage({
    required this.pokemonsIdDetails,
    super.key,
  });

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    final homeController = Get.find<HomeController>();
    final splashController = Get.find<SplashController>();

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        centerTitle: true,
        backgroundColor: AppColors.white,
        title: Image.asset(
          AppImages.pokemons,
          fit: BoxFit.cover,
          height: 60,
          width: 60,
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) => SizedBox(
          height: constraints.maxHeight,
          width: constraints.maxWidth,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 280,
                  width: constraints.maxWidth,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 87, vertical: 63),
                  decoration: const BoxDecoration(
                    color: AppColors.backgroundDetails,
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                    ),
                  ),
                  child: SvgPicture.network(widget.pokemonsIdDetails.svg ?? ''),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 11, 20, 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.pokemonsIdDetails.name!.toUpperCase(),
                        style: AppTextStyles.textBold18,
                      ),
                      const Spacer(),
                      ValueListenableBuilder<Box>(
                          valueListenable:
                              splashController.boxIsTrue.listenable(),
                          builder: (_, box, __) {
                            return IconButton(
                              splashRadius: 30,
                              color: const Color(0xFF141E26),
                              iconSize: 30,
                              icon: box.get(widget.pokemonsIdDetails.name,
                                      defaultValue: false)
                                  ? const Icon(Icons.favorite,
                                      color: Colors.red)
                                  : const Icon(Icons.favorite_border),
                              onPressed: () {
                                setState(() {
                                  widget.pokemonsIdDetails.favorite =
                                      !widget.pokemonsIdDetails.favorite;

                                  splashController.boxIsTrue.put(
                                      widget.pokemonsIdDetails.name,
                                      widget.pokemonsIdDetails.favorite);

                                  homeController.addFavorite();
                                });
                              },
                            );
                          }),
                    ],
                  ),
                ),
                DescriptionWidget(
                  title: 'Weight',
                  data: widget.pokemonsIdDetails.weight.toString(),
                ),
                DescriptionWidget(
                  title: 'Type',
                  data: widget.pokemonsIdDetails.types ?? '',
                ),
                DescriptionWidget(
                  title: 'Ability',
                  data: widget.pokemonsIdDetails.mainSkill ?? '',
                ),
                DescriptionWidget(
                  title: 'Specie',
                  data: widget.pokemonsIdDetails.species ?? '',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
