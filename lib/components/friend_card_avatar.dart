import 'package:flutter/material.dart';

class FriendCardAvatar extends StatefulWidget {
  @override
  _FriendCardAvatarState createState() => _FriendCardAvatarState();
}

class _FriendCardAvatarState extends State<FriendCardAvatar> {
  @override
  Widget build(BuildContext context) {
    return ClipOval(
        child: Image.asset(
      'images/bluesquare.jpg',
      height: 50.0,
      width: 50.0,
    ));
  }
}
