import 'package:flutter/material.dart';

class FriendCardAvatar extends StatefulWidget {
  FriendCardAvatar(this.avatar);

  final String avatar;

  @override
  _FriendCardAvatarState createState() => _FriendCardAvatarState();
}

class _FriendCardAvatarState extends State<FriendCardAvatar> {
  @override
  Widget build(BuildContext context) {
    return ClipOval(
        child: Image.asset(
      widget.avatar,
      height: 50.0,
      width: 50.0,
    ));
  }
}
