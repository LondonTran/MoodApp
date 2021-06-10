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
    printFriendsList();
  }

  void printFriendsList() {
    print("friendsList data from friends_feed");
    print(widget.friendsList);
    print("friendsList length from friends_feed");
    print(widget.friendsList.length);
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
