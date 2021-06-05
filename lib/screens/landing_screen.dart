import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mood/components/nav_drawer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseAuth auth = FirebaseAuth.instance;
User currentUser;

class LandingScreen extends StatefulWidget {
  static const String id = 'landing_screen';

  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  final _auth = FirebaseAuth.instance;
  Future<List> friendsList;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
    getFriendsList();
  }

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser;
      if (user != null) {
        currentUser = user;
      }
    } catch (e) {
      print(e);
    }
  }

  void getFriendsList() {
    String uid = auth.currentUser.uid.toString();
    friendsList = FirebaseFirestore.instance
        .collection("Users")
        .doc(uid)
        .get()
        .then((value) {
      return value.data()["friends"];
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
