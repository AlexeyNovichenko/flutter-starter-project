import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_starter/api/firebase/firebase_authentication.dart';

class FirebaseFirestoreApi {
  final _db = Firestore.instance;

  Stream<QuerySnapshot> getAllBabies() {
    String userId = FirebaseAuthenticator().user.uid;
    Query query = _db.collection("baby").where("author", isEqualTo: userId);
    Stream<QuerySnapshot> querySnapshot = query.snapshots();
    return querySnapshot;
  }
}
