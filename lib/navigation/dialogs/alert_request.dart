// Based on dialog service from https://medium.com/flutter-community/manager-your-flutter-dialogs-with-a-dialog-manager-1e862529523a

import 'package:flutter/widgets.dart';

import 'dialog_manager.dart';

class AlertRequest {
  final String title;
  final String description;
  final String buttonTitle;
  final DialogType type;
  final List<Map<String, Function>> options;

  AlertRequest({
    @required this.title,
    @required this.description,
    @required this.buttonTitle,
    @required this.type,
    this.options,
  });
}
