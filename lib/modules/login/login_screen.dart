import 'package:flutter/material.dart';
import 'package:flutter_starter/modules/login/login_bloc.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> {
  LoginScreenBloc _bloc;

  _init(BuildContext context) {
    _bloc = Provider.of(context);
  }

  _title() {
    return Center(
      child: Text(
        "Firebase Starter Login",
        style: TextStyle(
          fontSize: 30,
          color: Colors.white,
        ),
      ),
    );
  }

  _form() {
    return Container(
        child: Column(
      children: <Widget>[
        Container(
            padding: EdgeInsets.only(left: 10, right: 10),
            color: Colors.white,
            child: TextField(
              controller: _bloc.email,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Enter your email',
              ),
            )),
        Padding(padding: EdgeInsets.all(10)),
        Container(
            padding: EdgeInsets.only(left: 10, right: 10),
            color: Colors.white,
            child: TextField(
              controller: _bloc.password,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Enter your password',
              ),
            )),
      ],
    ));
  }

  _submitButton() {
    return Container(
        width: MediaQuery.of(context).size.width * 0.8,
        child: FlatButton(
          color: Colors.redAccent,
          onPressed: _bloc.submitForm,
          child: Text("Log In"),
        ));
  }

  _mainContent() {
    return Container(
        margin: EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Image.asset("assets/images/food.png"),
            ),
            Expanded(
              flex: 4,
              child: _title(),
            ),
            Expanded(
              flex: 5,
              child: _form(),
            ),
            Expanded(
              flex: 1,
              child: _submitButton(),
            )
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    _init(context);
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.black,
      body: SafeArea(child: _mainContent()),
    );
  }
}
