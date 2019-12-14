import 'package:flutter/material.dart';
import 'package:flutter_starter/api/firebase/firebase_authentication.dart';
import 'package:flutter_starter/modules/home/home_bloc.dart';
import 'package:flutter_starter/modules/home/home_screen.dart';
import 'package:flutter_starter/navigation/dialogs/dialog_manager.dart';
import 'package:flutter_starter/navigation/dialogs/dialog_service.dart';
import 'package:flutter_starter/navigation/dialogs/global_dialog_service.dart';
import 'package:flutter_starter/navigation/navigation/global_navigation_service_locator.dart';
import 'package:flutter_starter/navigation/navigation/navigation_service.dart';

class LoginScreenBloc {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  static final NavigationService _navigationService =
      GlobalNavigationServiceLocator().locator<NavigationService>();

  static final DialogService _dialogService =
      GlobalDialogServiceLocator().locator<DialogService>();

  submitForm() async {
    try {
      await FirebaseAuthenticator().signIn(email.text, password.text);
      final HomeBloc homeBloc = HomeBloc();
      _navigationService.pushReplacementNamed(HomeScreen.routeName,
          arguments: homeBloc);
    } catch (e) {
      _dialogService.showDialog(
          title: "Incorrect Username or Password",
          buttonTitle: "OK",
          description:
              "You entered an incorrect username and password, please correct your submission and retry",
          type: DialogType.SIMPLE);
    }
  }
}
