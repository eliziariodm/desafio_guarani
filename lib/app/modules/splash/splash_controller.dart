import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../../core/hive/pokemon_hive_adapter.dart';
import '../../models/pokemons_id_model.dart';
import '../../routes/app_pages.dart';

class SplashController extends GetxController {
  late Box box;

  @override
  onInit() async {
    super.onInit();

    Hive.registerAdapter(PokemonHiveAdapter());
    box = await Hive.openBox<PokemonsIdModel>('favorites');
  }

  @override
  void onReady() async {
    super.onReady();
    await 2.delay();

    Get.offAllNamed(Routes.HOME);
  }
}
