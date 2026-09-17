import 'package:flutter/material.dart';
import 'core/services/app_config.dart';
import 'app.dart';
import 'flavors.dart';

void main() {
  AppConfig.setFlavor(Flavor.dev);
  F.appFlavor = Flavor.dev;
  runApp(const App());
}
