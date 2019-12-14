import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_starter/api/firebase/firebase_firestore.dart';
import 'package:flutter_starter/modules/home/home_bloc.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = "/HomeScreen";

  @override
  State<StatefulWidget> createState() {
    return HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen> {
  HomeBloc _bloc;

  _init(BuildContext context) {
    _bloc = Provider.of(context);
  }

  _buildRow(DocumentSnapshot snapshot) {
    return ListTile(
      title: Text(snapshot.data["name"]),
    );
  }

  _usersList(AsyncSnapshot<QuerySnapshot> snapshot) {
    return ListView(
      children: List.generate(
          snapshot.hasData ? snapshot.data.documents.length : 0,
          (int index) => _buildRow(snapshot.data.documents[index])),
    );
  }

  _usersSection() {
    return StreamBuilder(
      stream: FirebaseFirestoreApi().people,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        return Column(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Text("Existing Users"),
            ),
            Expanded(
              flex: 1,
              child: _usersList(snapshot),
            )
          ],
        );
      },
    );
  }

  _createUserSection() {
    return Column(
      children: <Widget>[
        Expanded(
            flex: 1,
            child: TextField(
              controller: _bloc.newPersonName,
              decoration: InputDecoration(
                  border: InputBorder.none, hintText: 'Enter new person name'),
            )),
        Expanded(
            flex: 1,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.80,
              child: FlatButton(
                color: Colors.red,
                child: Text("Add"),
                onPressed: () {
                  _bloc.createPerson();
                },
              ),
            ))
      ],
    );
  }

  _mainContent() {
    return Container(
        margin: EdgeInsets.only(left: 30, right: 30),
        child: Container(
            child: Column(
          children: <Widget>[
            Expanded(flex: 5, child: _usersSection()),
            Expanded(
              flex: 1,
              child: _createUserSection(),
            )
          ],
        )));
  }

  @override
  Widget build(BuildContext context) {
    _init(context);
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      body: SafeArea(child: _mainContent()),
    );
  }
}
