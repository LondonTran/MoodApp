import 'package:flutter/material.dart';

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
    return Padding(
      padding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0),
      child: Card(
        color: Colors.grey,
        // elevation: 5.0,
        shadowColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
          child: Text('Hello'),
        ),
      ),
    );
  }
}
