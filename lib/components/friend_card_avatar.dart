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
    return CircleAvatar(
      radius: 30.0,
      backgroundImage: AssetImage(widget.avatar),
    );
  }
}
