import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mood/components/friend_card.dart';
import 'package:mood/constants.dart';

class FriendsFeed extends StatefulWidget {
  FriendsFeed(this.friendsList);

  final List<dynamic> friendsList;

  @override
  _FriendsFeedState createState() => _FriendsFeedState();
}

class _FriendsFeedState extends State<FriendsFeed> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
          child: Text(
            'Friends',
            style: TextStyle(
              color: headerColor,
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      for (int index = 0; index < widget.friendsList.length; index++)
        FriendCard(widget.friendsList, index),
    ]);
  }
}
