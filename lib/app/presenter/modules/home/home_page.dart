import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/ui/app_colors.dart';
import '../../../core/ui/app_images.dart';
import 'pages/favorite_page.dart';
import 'pages/initial_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController? _pageController;
  RxInt initialPage = 0.obs;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: initialPage.value,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
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
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        onPageChanged: (page) {
          initialPage.value = page;
        },
        children: const [
          InitialPage(),
          FavoritePage(),
        ],
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Favoritos',
            ),
          ],
          currentIndex: initialPage.value,
          onTap: (page) {
            _pageController?.animateToPage(
              page,
              duration: const Duration(milliseconds: 100),
              curve: Curves.ease,
            );
          },
        ),
      ),
    );
  }
}
