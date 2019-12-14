import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_starter/modules/login/login_bloc.dart';
import 'package:flutter_starter/modules/login/login_screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final LoginScreenBloc _bloc = LoginScreenBloc();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Baby Names',
      home: Provider.value(
        value: _bloc,
        child: LoginScreen(),
      ),
    );
  }
}
