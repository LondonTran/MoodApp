import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mood/components/nav_drawer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseAuth auth = FirebaseAuth.instance;
User currentUser;
String currentUserUID;
List<dynamic> friendsList;

class LandingScreen extends StatefulWidget {
  static const String id = 'landing_screen';

  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  final _auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    getUserData();
  }

  void getUserData() {
    getCurrentUser();
    getCurrentUserUID();
    getFriendsList();
  }

  void getCurrentUser() {
    currentUser = _auth.currentUser;
  }

  void getCurrentUserUID() {
    currentUserUID = auth.currentUser.uid;
  }

  void getFriendsList() async {
    await FirebaseFirestore.instance
        .collection("Users")
        .doc(currentUserUID)
        .get()
        .then((value) {
      friendsList = value.data()["friends"];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Mood'),
        centerTitle: true,
      ),
      // body: ReorderableListView(
      //   padding: const EdgeInsets.symmetric(horizontal: 40),
      //   children: <Widget>[
      //     for (int index = 0; index < _items.length; index++)
      //       ListTile(
      //         key: Key('$index'),
      //         tileColor: _items[index].isOdd ? oddItemColor : evenItemColor,
      //         title: Text('Item ${_items[index]}'),
      //       ),
      //   ],
      //   onReorder: (int oldIndex, int newIndex) {
      //     setState(() {
      //       if (oldIndex < newIndex) {
      //         newIndex -= 1;
      //       }
      //       final int item = _items.removeAt(oldIndex);
      //       _items.insert(newIndex, item);
      //     });
      //   },
      // ),
      drawer: NavDrawer(_auth),
    );
  }
}
