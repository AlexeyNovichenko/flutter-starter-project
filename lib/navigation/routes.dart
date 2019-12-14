import 'package:flutter/material.dart';
import 'package:flutter_starter/modules/home/home_bloc.dart';
import 'package:flutter_starter/modules/home/home_screen.dart';
import 'package:provider/provider.dart';

class Routes {
  static MaterialPageRoute getMaterialPageRoute(RouteSettings settings) {
    switch (settings.name) {
      case HomeScreen.routeName:
        return getHomeRoute(settings);
      default:
        return null;
    }
  }

  static MaterialPageRoute getHomeRoute(RouteSettings settings) {
    return MaterialPageRoute(
        settings: RouteSettings(name: HomeScreen.routeName),
        builder: (context) => Provider<HomeBloc>.value(
            child: HomeScreen(), value: settings.arguments));
  }
}
