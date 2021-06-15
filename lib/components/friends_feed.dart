import 'package:flutter/material.dart';
import 'package:mood/components/friend_card.dart';

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
        alignment: Alignment.bottomLeft,
        child: Text(
          'Friends',
        ),
      ),
      for (int index = 0; index < widget.friendsList.length; index++)
        FriendCard(widget.friendsList, index),
    ]);
  }
}
