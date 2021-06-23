import 'package:flutter/material.dart';
import 'package:mood/components/friend_card_avatar.dart';
import 'package:mood/constants.dart';

class FriendCard extends StatefulWidget {
  FriendCard(this.friendsList, this.index);

  final List<dynamic> friendsList;
  final int index;

  @override
  _FriendCardState createState() => _FriendCardState();
}

class _FriendCardState extends State<FriendCard> {
  bool isCardTappedOnce = false;
  String friendUsername;

  String getFriendUsername() {
    return friendUsername = widget.friendsList[widget.index].toString();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        child: Container(
          width: 400.0,
          height: 150.0,
          child: Card(
              color: isCardTappedOnce ? tappedColor : unTappedColor,
              shadowColor: Colors.blue,
              elevation: isCardTappedOnce ? tappedElevation : unTappedElevation,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: InkWell(
                onTap: () {
                  setState(() {
                    isCardTappedOnce = !isCardTappedOnce;
                  });
                },
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(10.0, 5.0, 0.0, 0.0),
                      child: Row(
                        children: <Widget>[
                          Text(
                            getFriendUsername(),
                            style: TextStyle(
                              color: Colors.blue.shade200,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 30.0),
                            child: FriendCardAvatar('images/face_one.jpg')),
                        Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 30.0),
                            child: FriendCardAvatar('images/photo_two.jpg')),
                        Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 30.0),
                            child: FriendCardAvatar('images/photo_three.jpg')),
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
