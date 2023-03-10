import 'dart:io';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

class HiveConfig {
  static start() async {
    Directory dir = await getApplicationSupportDirectory();

    await Hive.initFlutter(dir.path);
  }
}
