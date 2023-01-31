import 'package:flutter/material.dart';

import '../../../core/ui/app_colors.dart';
import '../../../core/ui/app_images.dart';
import '../../../core/ui/app_text_styles.dart';

class DetailsPage extends StatelessWidget {
  final String nameDetails;

  const DetailsPage({
    required this.nameDetails,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
                    color: AppColors.backgroundSearch,
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                    ),
                  ),
                  child: Image.asset(AppImages.pikachu),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 11, 20, 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        nameDetails,
                        style: AppTextStyles.textBold18,
                      ),
                      const Spacer(),
                      const Icon(Icons.favorite_outline),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 16, 20, 5),
                  child: Text(
                    'Descriçāo',
                    style: AppTextStyles.textBold16,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 16, 20, 5),
                  child: Text(
                    '"Charmeleon destrói seus oponentes sem pena com suas garras afiadas. Torna-se agressivo quando encontra um oponente forte e então a chama na ponta da sua cauda queima intensamente em uma cor azulada."',
                    textAlign: TextAlign.justify,
                    style: AppTextStyles.textSemiBold14,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
