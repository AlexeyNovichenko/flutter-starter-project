// Based on dialog service from https://medium.com/flutter-community/manager-your-flutter-dialogs-with-a-dialog-manager-1e862529523a

import 'package:flutter_starter/navigation/dialogs/dialog_service.dart';
import 'package:get_it/get_it.dart';

class GlobalDialogServiceLocator {
  GetIt locator = GetIt.instance;

  static final GlobalDialogServiceLocator _singleton =
      new GlobalDialogServiceLocator._internal();

  factory GlobalDialogServiceLocator() {
    return _singleton;
  }

  GlobalDialogServiceLocator._internal() {
    setupLocator();
  }

  void setupLocator() {
    locator.registerLazySingleton(() => DialogService());
  }
}
