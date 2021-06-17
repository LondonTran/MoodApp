import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mood/components/friends_feed.dart';
import 'package:mood/components/nav_drawer.dart';
import 'package:mood/services/user_data.dart';

class LandingScreen extends StatefulWidget {
  static const String id = 'landing_screen';

  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  FirebaseAuth auth;
  List<dynamic> friendsList;
  bool isLoading = true;

  Future<void> pullUserData() async {
    UserData userData = UserData();
    await userData.getUserData();
    setState(() {
      auth = userData.auth;
      friendsList = userData.friendsList;
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    pullUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Mood'),
          centerTitle: true,
        ),
        drawer: NavDrawer(auth),
        body: SingleChildScrollView(
          child: isLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Column(
                  children: <Widget>[
                    SizedBox(
                      height: 100.0,
                      width: 30.0,
                    ),
                    FriendsFeed(friendsList),
                  ],
                ),
        )
        // FriendsFeed(friendsList),
        );
  }
}
