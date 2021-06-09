import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mood/components/friends_feed.dart';
import 'package:mood/components/nav_drawer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mood/components/friends_feed.dart';



class LandingScreen extends StatefulWidget {
  static const String id = 'landing_screen';

  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Mood'),
        centerTitle: true,
      ),
      drawer: NavDrawer(),
      body: FriendsFeed(),
    );
  }
}
