import 'package:get/get.dart';

import '../presenter/modules/home/home_binding.dart';
import '../presenter/modules/home/home_page.dart';
import '../presenter/modules/splash/splash_binding.dart';
import '../presenter/modules/splash/splash_page.dart';

part 'app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: Routes.SPLASH,
      page: () => const SplashPage(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: Routes.HOME,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
  ];
}
