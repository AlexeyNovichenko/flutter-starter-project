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
      title: Container(
        padding: EdgeInsets.all(10),
        color: Colors.white,
        child: Text(snapshot.data["name"]),
      ),
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
        return Container(
            margin: EdgeInsets.only(bottom: 20),
            child: Column(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Container(
                      child: Text(
                    "Existing Users",
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  )),
                ),
                Expanded(
                  flex: 7,
                  child: _usersList(snapshot),
                )
              ],
            ));
      },
    );
  }

  _createUserSection() {
    return Column(
      children: <Widget>[
        Expanded(
            flex: 1,
            child: Container(
                alignment: Alignment.center,
                color: Colors.white,
                child: TextField(
                  controller: _bloc.newPersonName,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Enter new person name',
                  ),
                ))),
      ],
    );
  }

  _mainContent() {
    return Container(
        margin: EdgeInsets.all(30),
        child: Container(
            child: Column(
          children: <Widget>[
            Expanded(
              flex: 7,
              child: _usersSection(),
            ),
            Expanded(
              flex: 1,
              child: _createUserSection(),
            ),
            Expanded(
                flex: 1,
                child: Container(
                  margin: EdgeInsets.only(top: 10),
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
        )));
  }

  @override
  Widget build(BuildContext context) {
    _init(context);
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(child: _mainContent()),
    );
  }
}
