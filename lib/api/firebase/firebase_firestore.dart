import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_starter/api/firebase/firebase_authentication.dart';

class FirebaseFirestoreApi {
  final _db = Firestore.instance;

  Future<List<DocumentSnapshot>> getAllBabies() async {
    FirebaseUser user = await FirebaseAuthenticator().getCurrentUser();
    Query query = _db.collection("baby").where("author", isEqualTo: user.uid);
    QuerySnapshot querySnapshot = await query.getDocuments();
    return querySnapshot.documents;
  }
}
