import 'package:flutter/material.dart';

import '../../../core/ui/app_colors.dart';
import '../../../core/ui/app_images.dart';
import '../../../core/ui/app_text_styles.dart';

class CustomPokemonContainerWidget extends StatelessWidget {
  final Function()? onTap;
  final String name;

  const CustomPokemonContainerWidget({
    required this.name,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
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
              flex: 1,
              child: Text(
                name,
                style: AppTextStyles.textBold16,
              ),
            ),
            Flexible(
              flex: 2,
              child: Image.asset(AppImages.pikachu),
            ),
          ],
        ),
      ),
    );
  }
}
