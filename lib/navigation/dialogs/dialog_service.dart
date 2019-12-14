// Based on dialog service from https://medium.com/flutter-community/manager-your-flutter-dialogs-with-a-dialog-manager-1e862529523a

import 'dart:async';

import 'package:flutter_starter/navigation/dialogs/alert_request.dart';
import 'package:flutter_starter/navigation/dialogs/alert_response.dart';
import 'package:flutter_starter/navigation/dialogs/dialog_manager.dart';

class DialogService {
  Function(AlertRequest) _showDialogListener;
  Completer<AlertResponse> _dialogCompleter;

  void registerDialogListener(Function(AlertRequest) showDialogListener) {
    _showDialogListener = showDialogListener;
  }

  Future<AlertResponse> showDialog({
    String title,
    String description,
    String buttonTitle = 'Ok',
    DialogType type = DialogType.SIMPLE,
    List<Map<String, Function>> options,
  }) {
    _dialogCompleter = Completer<AlertResponse>();
    _showDialogListener(AlertRequest(
        title: title,
        description: description,
        buttonTitle: buttonTitle,
        type: type,
        options: options));
    return _dialogCompleter.future;
  }

  static void NO_RETURN() {
    // When a use hits cancel they don't need the dialog to do anything
    // and the dialog service takes care of closing the modal. This
    // empty function exists as a placeholder so that the modal can
    // get created
  }

  void dialogComplete(AlertResponse response) {
    _dialogCompleter.complete(response);
    _dialogCompleter = null;
  }
}
