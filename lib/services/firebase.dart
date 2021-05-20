import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<void> userSetup(String username) async {
  FirebaseAuth auth = FirebaseAuth.instance;
  List friendsList = [];
  String uid = auth.currentUser.uid.toString();
  DocumentReference users =
      FirebaseFirestore.instance.collection('Users').doc(uid);
  users.set({
    'username': username,
    'uid': uid,
    'friends': friendsList,
  });
}
