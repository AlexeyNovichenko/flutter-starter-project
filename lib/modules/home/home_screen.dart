import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_starter/api/firebase/firebase_firestore.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = "/HomeScreen";

  @override
  State<StatefulWidget> createState() {
    return HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen> {
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
      stream: FirebaseFirestoreApi().getAllBabies(),
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

  _createUserSection() {}

  _mainContent() {
    return Column(
      children: <Widget>[
        Expanded(flex: 1, child: _usersSection()),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      body: SafeArea(child: _mainContent()),
    );
  }
}
