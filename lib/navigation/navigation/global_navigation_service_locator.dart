// Based on https://medium.com/flutter-community/navigate-without-context-in-flutter-with-a-navigation-service-e6d76e880c1c

import 'package:flutter_starter/navigation/navigation/navigation_service.dart';
import 'package:get_it/get_it.dart';

class GlobalNavigationServiceLocator {
  GetIt locator = GetIt.instance;

  static final GlobalNavigationServiceLocator _singleton =
      new GlobalNavigationServiceLocator._internal();

  factory GlobalNavigationServiceLocator() {
    return _singleton;
  }

  GlobalNavigationServiceLocator._internal() {
    setupLocator();
  }

  void setupLocator() {
    locator.registerLazySingleton(() => NavigationService());
  }
}
