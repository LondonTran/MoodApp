import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

User currentUser;
FirebaseAuth auth = FirebaseAuth.instance;

class LandingScreen extends StatefulWidget {
  static const String id = 'landing_screen';

  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  final _auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser;
      if (user != null) {
        currentUser = user;
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      appBar: AppBar(
        title: Text('Mood'),
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                _auth.signOut();
                Navigator.pop(context);
              }),
        ],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Center(
              child: Container(
                padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                child: Text(
                  "How are you feeling?",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                  ),
                ),
              ),
            ),
            Center(
              child: Container(
                padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                child: TextFormField(
                  cursorColor: Colors.yellow,
                  initialValue: 'I\'m feeling...',
                  maxLength: 20,
                  decoration: InputDecoration(
                    labelText: 'Label text',
                    labelStyle: TextStyle(
                      color: Color(0xFF6200EE),
                    ),
                    helperText: 'Helper text',
                    suffixIcon: Icon(
                      Icons.check_circle,
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF6200EE)),
                    ),
                  ),
                ),
              ),
            ),
            ListView(
              padding: const EdgeInsets.all(8),
              children: <Widget>[
                Container(
                  height: 50,
                  color: Colors.amber[600],
                  child: const Center(child: Text('Entry A')),
                ),
                Container(
                  height: 50,
                  color: Colors.amber[500],
                  child: const Center(child: Text('Entry B')),
                ),
                Container(
                  height: 50,
                  color: Colors.amber[100],
                  child: const Center(child: Text('Entry C')),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
