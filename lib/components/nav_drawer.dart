import 'package:flutter/material.dart';
import 'package:mood/screens/login_screen.dart';

class NavDrawer extends StatelessWidget {
  NavDrawer(this._auth);

  final _auth;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text('Drawer Header'),
          ),
          ListTile(
            title: Text('Item 1'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('Sign Out'),
            onTap: () {
              _auth.signOut();
              Navigator.of(context)
                  .pushNamedAndRemoveUntil(LoginScreen.id, (route) => false);
            },
          ),
        ],
      ),
    );
  }
}
