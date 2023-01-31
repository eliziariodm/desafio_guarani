import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../core/ui/app_colors.dart';
import '../../../core/ui/app_images.dart';
import '../../../core/ui/app_text_styles.dart';
import '../home_controller.dart';
import '../widgets/description_widget.dart';

class DetailsPage extends StatelessWidget {
  final String nameDetails;
  final String svgDetails;
  final String mainSkillDetails;
  final String speciesDetails;
  final String typesDetails;
  final int weightDetails;

  const DetailsPage({
    required this.nameDetails,
    required this.svgDetails,
    required this.mainSkillDetails,
    required this.speciesDetails,
    required this.typesDetails,
    required this.weightDetails,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final homeController = Get.find<HomeController>();

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
                  child: SvgPicture.network(svgDetails),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 11, 20, 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        nameDetails.toUpperCase(),
                        style: AppTextStyles.textBold18,
                      ),
                      const Spacer(),
                      Obx(
                        () => IconButton(
                          splashRadius: 30,
                          color: const Color(0xFF141E26),
                          iconSize: 30,
                          icon: homeController.isFavorite.value
                              ? const Icon(Icons.favorite, color: Colors.red)
                              : const Icon(Icons.favorite_border),
                          onPressed: () {
                            homeController.isFavorite.value =
                                !homeController.isFavorite.value;
                            log('aqui ${homeController.isFavorite.value}');
                            homeController.addFavorite();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                DescriptionWidget(
                  title: 'Weight',
                  data: weightDetails.toString(),
                ),
                DescriptionWidget(
                  title: 'Type',
                  data: typesDetails,
                ),
                DescriptionWidget(
                  title: 'Ability',
                  data: mainSkillDetails,
                ),
                DescriptionWidget(
                  title: 'Specie',
                  data: speciesDetails,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
