// Based on dialog service from https://medium.com/flutter-community/manager-your-flutter-dialogs-with-a-dialog-manager-1e862529523a

import 'package:flutter/material.dart';
import 'package:flutter_starter/navigation/dialogs/alert_request.dart';
import 'package:flutter_starter/navigation/dialogs/global_dialog_service.dart';

import 'dialog_service.dart';

enum DialogType {
  SIMPLE,
  WITH_OPTIONS,
}

class DialogManager extends StatefulWidget {
  final Widget child;

  DialogManager({Key key, this.child}) : super(key: key);
  _DialogManagerState createState() => _DialogManagerState();
}

class _DialogManagerState extends State<DialogManager> {
  DialogService _dialogService =
      GlobalDialogServiceLocator().locator<DialogService>();

  @override
  void initState() {
    super.initState();
    _dialogService.registerDialogListener(_showDialog);
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  void _showDialog(AlertRequest request) async {
    switch (request.type) {
      case DialogType.SIMPLE:
        {
          showBasicDialog(request);
          return;
        }
      case DialogType.WITH_OPTIONS:
        {
          showSimpleAlertWithOptions(request);
          return;
        }
      default:
        {
          // FIXME: THROW AN ERROR
          return;
        }
    }
  }

  void completeDialog() {
    _dialogService.dialogComplete(null);
    Navigator.of(context).pop();
  }

  void showBasicDialog(AlertRequest request) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          final title = request.title;
          final content = request.description;
          final buttonText = request.buttonTitle;

          return AlertDialog(
            title: Text(title),
            content: Text(content),
            actions: <Widget>[
              new FlatButton(
                key: Key('errorButton'),
                child: new Text(buttonText),
                onPressed: () {
                  _dialogService.dialogComplete(null);
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  void showSimpleAlertWithOptions(AlertRequest request) {
    List<Widget> optionButtons = [];

    for (Map<String, Function> option in request.options) {
      for (String key in option.keys) {
        optionButtons.add(FlatButton(
          key: Key(key),
          child: Text(key),
          onPressed: () async {
            // Call function provided
            option[key]();

            // Complete the Future
            _dialogService.dialogComplete(null);

            // Close the dialog
            Navigator.of(context).pop();
          },
        ));
      }
    }

    showDialog(
        context: this.context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              request.title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
            ),
            content: Text(
              request.description,
              style: TextStyle(fontSize: 16),
            ),
            actions: optionButtons,
          );
        });
  }
}
