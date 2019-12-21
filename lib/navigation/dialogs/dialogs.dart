import 'package:flutter/material.dart';
import 'package:flutter_starter/navigation/navigation/global_navigation_service_locator.dart';
import 'package:flutter_starter/navigation/navigation/navigation_service.dart';

class Dialogs {
  static final NavigationService _navigationService =
      GlobalNavigationServiceLocator().locator<NavigationService>();

  static BuildContext getOverlayContext() {
    return _navigationService.navigatorKey.currentState.overlay.context;
  }

  static void showBasicDialog({
    String title,
    String content,
    String buttonText,
  }) {
    showDialog(
        context: getOverlayContext(),
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title),
            content: Text(content),
            actions: <Widget>[
              new FlatButton(
                key: Key('errorButton'),
                child: new Text(buttonText),
                onPressed: () {
                  _navigationService.pop();
                },
              ),
            ],
          );
        });
  }
}
