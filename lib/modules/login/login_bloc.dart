import 'package:flutter/material.dart';
import 'package:flutter_starter/api/firebase/firebase_authentication.dart';

class LoginScreenBloc {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  submitForm({
    @required Function onSuccess,
    @required Function onFailure,
  }) async {
    try {
      await FirebaseAuthenticator().signIn(email.text, password.text);
      onSuccess();
    } catch (e) {
      onFailure();
    }
  }
}
