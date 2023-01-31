import 'package:flutter/material.dart';

import '../../core/ui/app_colors.dart';
import '../../core/ui/app_images.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: LayoutBuilder(
        builder: (context, constraints) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Center(
            child: Image.asset(
              AppImages.pokemons,
              fit: BoxFit.cover,
              height: 371,
              width: 350,
            ),
          ),
        ),
      ),
    );
  }
}
