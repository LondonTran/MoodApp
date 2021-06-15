import 'package:flutter/material.dart';
import 'package:mood/components/friend_card_avatar.dart';

class FriendCard extends StatefulWidget {
  FriendCard(this.friendsList, this.index);

  final List<dynamic> friendsList;
  final int index;

  @override
  _FriendCardState createState() => _FriendCardState();
}

class _FriendCardState extends State<FriendCard> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        child: Container(
          width: 400.0,
          height: 150.0,
          child: Card(
              color: Colors.grey.shade100,
              shadowColor: Colors.blue,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: InkWell(
                onTap: () {},
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(10.0, 5.0, 0.0, 0.0),
                      child: Row(
                        children: <Widget>[
                          Text(
                            '${widget.friendsList[widget.index]}',
                            style: TextStyle(
                              color: Colors.blue.shade200,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 30.0),
                            child: FriendCardAvatar()),
                        Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 30.0),
                            child: FriendCardAvatar()),
                        Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 30.0),
                            child: FriendCardAvatar()),
                      ],
                    ),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
