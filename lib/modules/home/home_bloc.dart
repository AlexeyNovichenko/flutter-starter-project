import 'package:flutter/material.dart';
import 'package:flutter_starter/api/firebase/firebase_firestore.dart';

class HomeBloc {
  final TextEditingController newPersonName = TextEditingController();

  Future<void> createPerson() {
    Map<String, dynamic> newPerson = Map<String, dynamic>.from({
      "name": newPersonName.text,
      "votes": 0,
    });
    FirebaseFirestoreApi().createNewPerson(newPerson);
    return Future.value();
  }
}
