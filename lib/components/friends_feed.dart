import 'package:flutter/material.dart';
import 'package:mood/services/user_data.dart';

class FriendsFeed extends StatefulWidget {
  @override
  _FriendsFeedState createState() => _FriendsFeedState();
}

class _FriendsFeedState extends State<FriendsFeed> {
  @override
  void initState() {
    super.initState();
    printFriendsList(widget.friendsList);
  }

  void printFriendsList(List<dynamic> friendsList) {
    print("friendsList from friends_feed.dart");
    print(friendsList);
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final Color oddItemColor = colorScheme.primary.withOpacity(0.05);
    final Color evenItemColor = colorScheme.primary.withOpacity(0.15);

    return ReorderableListView(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      children: <Widget>[
        for (int index = 0; index < widget.friendsList.length; index++)
          ListTile(
            key: Key('$index'),
            tileColor:
                widget.friendsList[index].isOdd ? oddItemColor : evenItemColor,
            title: Text('Item ${widget.friendsList[index]}'),
          ),
      ],
      onReorder: (int oldIndex, int newIndex) {
        setState(() {
          if (oldIndex < newIndex) {
            newIndex -= 1;
          }
          final int item = widget.friendsList.removeAt(oldIndex);
          widget.friendsList.insert(newIndex, item);
        });
      },
    );
  }
}
