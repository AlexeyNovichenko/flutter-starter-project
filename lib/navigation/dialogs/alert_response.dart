// Based on dialog service from https://medium.com/flutter-community/manager-your-flutter-dialogs-with-a-dialog-manager-1e862529523a

class AlertResponse {
  final String fieldOne;
  final String fieldTwo;
  final bool confirmed;

  AlertResponse({
    this.fieldOne,
    this.fieldTwo,
    this.confirmed,
  });
}
