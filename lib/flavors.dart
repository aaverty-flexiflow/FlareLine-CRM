enum Flavor {
  dev,
  mocked,
}

class F {
  static late final Flavor appFlavor;

  static String get name => appFlavor.name;

  static String get title {
    switch (appFlavor) {
      case Flavor.dev:
        return 'FlareLine CRM Dev';
      case Flavor.mocked:
        return 'FlareLine CRM Mocked';
    }
  }

}
