import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserData {
  final _auth = FirebaseAuth.instance;
  User _currentUser;
  String _currentUserUID;
  List<dynamic> _friendsList;

  get auth => _auth;
  User get currentUser => _currentUser;
  String get currentUserUID => _currentUserUID;
  List<dynamic> get friendsList => _friendsList;

  void getUserData() async {
    getCurrentUser();
    getCurrentUserUID();
    await getFriendsList();
  }

  void getCurrentUser() {
    _currentUser = _auth.currentUser;
  }

  void getCurrentUserUID() {
    _currentUserUID = _auth.currentUser.uid;
  }

  Future<void> getFriendsList() async {
    await FirebaseFirestore.instance
        .collection("Users")
        .doc(_currentUserUID)
        .get()
        .then((value) {
      _friendsList = value.data()["friends"];
    });
    print("friendsList");
    print(_friendsList);
  }
}
