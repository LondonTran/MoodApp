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
    return Column(children: <Widget>[
      for (int index = 0; index < widget.friendsList.length; index++)
        Center(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            child: Container(
              width: 300.0,
              height: 100.0,
              child: Card(
                  color: Colors.grey.shade100,
                  shadowColor: Colors.blue,
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text('${widget.friendsList[index]}'),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Text('1st'),
                          Text('2nd'),
                          Text('3rd'),
                        ],
                      ),
                    ],
                  )),
            ),
          ),
        ),
    ]);
  }
}
