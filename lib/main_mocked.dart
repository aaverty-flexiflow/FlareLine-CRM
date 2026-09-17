import 'package:flutter/material.dart';
import 'core/services/app_config.dart';
import 'app.dart';

void main() {
  AppConfig.setFlavor(Flavor.mocked);
  runApp(const App());
}
