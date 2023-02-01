import 'package:flutter/material.dart';

import 'app/app_widget.dart';
import 'app/core/hive/hive_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveConfig.start();

  runApp(const AppWidget());
}
