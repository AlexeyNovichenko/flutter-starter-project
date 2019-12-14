// Based on https://medium.com/flutter-community/navigate-without-context-in-flutter-with-a-navigation-service-e6d76e880c1c

import 'package:flutter/material.dart';

class NavigationService {
  GlobalKey<NavigatorState> navigatorKey;

  static final NavigationService _singleton = NavigationService._internal();

  NavigationService._internal() {
    navigatorKey = new GlobalKey<NavigatorState>();
  }

  factory NavigationService() {
    return _singleton;
  }

  Future<dynamic> pushNamed(String routeName, {Object arguments}) {
    return navigatorKey.currentState.pushNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushReplacementNamed(String routeName, {Object arguments}) {
    return navigatorKey.currentState
        .pushReplacementNamed(routeName, arguments: arguments);
  }
}
