import 'package:flutter/material.dart';
import 'package:flutter_starter/modules/login/login_bloc.dart';
import 'package:flutter_starter/modules/login/login_screen.dart';
import 'package:flutter_starter/navigation/navigation/global_navigation_service_locator.dart';
import 'package:flutter_starter/navigation/navigation/navigation_service.dart';
import 'package:flutter_starter/navigation/routes.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final LoginScreenBloc _bloc = LoginScreenBloc();

  static final NavigationService _navigationService =
      GlobalNavigationServiceLocator().locator<NavigationService>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: _navigationService.navigatorKey,
      title: 'Framework',
      home: Provider.value(
        value: _bloc,
        child: LoginScreen(),
      ),
      onGenerateRoute: Routes.getMaterialPageRoute,
    );
  }
}
