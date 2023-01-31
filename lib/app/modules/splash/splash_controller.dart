import 'package:get/get.dart';

import '../../routes/app_pages.dart';

class SplashController extends GetxController {
  @override
  void onReady() async {
    super.onReady();
    await 2.delay();
    Get.offAllNamed(Routes.HOME);
  }
}
