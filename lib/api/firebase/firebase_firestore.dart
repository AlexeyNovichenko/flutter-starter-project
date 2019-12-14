import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_starter/api/firebase/firebase_authentication.dart';
import 'package:uuid/uuid.dart';

class FirebaseFirestoreApi {
  final _db = Firestore.instance;

  var uuid = Uuid();

  Stream<QuerySnapshot> get people {
    String userId = FirebaseAuthenticator().user.uid;
    Query query = _db.collection("baby").where("author", isEqualTo: userId);
    Stream<QuerySnapshot> querySnapshot = query.snapshots();
    return querySnapshot;
  }

  void createNewPerson(Map<String, dynamic> person) {
    person["author"] = FirebaseAuthenticator().user.uid;

    _db.collection("baby").document(uuid.v4()).setData(person);
  }
}
