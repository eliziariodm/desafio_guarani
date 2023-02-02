import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/ui/app_colors.dart';
import '../../../../core/ui/app_text_styles.dart';
import '../../../../infra/datasources/models/pokemons_id_model.dart';
import '../pages/details_page.dart';

class CustomPokemonContainerWidget extends StatelessWidget {
  final PokemonsIdModel pokemonsId;

  const CustomPokemonContainerWidget({
    required this.pokemonsId,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailsPage(
              pokemonsIdDetails: pokemonsId,
            ),
          ),
        );
      },
      child: Container(
        height: 110,
        decoration: BoxDecoration(
          color: AppColors.backgroundDetails,
          borderRadius: const BorderRadius.all(Radius.circular(5)),
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              flex: 2,
              child: Text(
                pokemonsId.name!.toUpperCase(),
                style: AppTextStyles.textBold16,
              ),
            ),
            Flexible(
              flex: 1,
              child: SvgPicture.network(
                pokemonsId.svg ?? '',
                height: 85,
                width: 85,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
