import 'data_service.dart';
import 'empty_data_service.dart';
import 'mock_data_service.dart';

enum Flavor {
  dev,
  mocked,
}

class AppConfig {
  static Flavor _flavor = Flavor.dev;
  static DataService? _dataService;

  static void setFlavor(Flavor flavor) {
    _flavor = flavor;
    _dataService = null; // Reset service when flavor changes
  }

  static Flavor get flavor => _flavor;

  static DataService get dataService {
    _dataService ??= _createDataService();
    return _dataService!;
  }

  static DataService _createDataService() {
    switch (_flavor) {
      case Flavor.dev:
        return EmptyDataService();
      case Flavor.mocked:
        return MockDataService();
    }
  }

  static bool get isDev => _flavor == Flavor.dev;
  static bool get isMocked => _flavor == Flavor.mocked;
}
