import 'package:flutter/material.dart';
import 'package:flutter_starter/modules/login/login_bloc.dart';
import 'package:flutter_starter/modules/login/login_screen.dart';
import 'package:flutter_starter/navigation/dialogs/dialog_manager.dart';
import 'package:flutter_starter/navigation/dialogs/global_dialog_service.dart';
import 'package:flutter_starter/navigation/navigation/global_navigation_service_locator.dart';
import 'package:flutter_starter/navigation/routes.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final LoginScreenBloc _bloc = LoginScreenBloc();

  MyApp() {
    GlobalDialogServiceLocator();
    GlobalNavigationServiceLocator();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Framework',
      builder: (BuildContext context, Widget widget) => Navigator(
        onGenerateRoute: (RouteSettings settings) => MaterialPageRoute(
          builder: (BuildContext context) => DialogManager(
            child: widget,
          ),
        ),
      ),
      home: Provider.value(
        value: _bloc,
        child: LoginScreen(),
      ),
      onGenerateRoute: Routes.getMaterialPageRoute,
    );
  }
}
