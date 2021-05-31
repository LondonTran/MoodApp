import 'package:flutter/material.dart';
import 'package:mood/components/rounded_button.dart';
import 'package:mood/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mood/screens/landing_screen.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:mood/services/firebase_auth_handler.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  bool showSpinner = false;
  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Center(
                child: Text('Login',
                    style: TextStyle(
                      fontSize: 60,
                      color: Colors.blue,
                    )),
              ),
              SizedBox(
                height: 48.0,
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Colors.grey,
                ),
                onChanged: (value) {
                  email = value;
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Email',
                ),
                // decoration: kTextFieldDecoration.copyWith(
                //   hintText: 'Email',
                //   hintStyle: TextStyle(
                //     color: Colors.grey,
                //   ),
                // ),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                obscureText: true,
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Colors.grey,
                ),
                onChanged: (value) {
                  password = value;
                },
                decoration: kTextFieldDecoration.copyWith(
                  hintText: 'Password',
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ),
              SizedBox(
                height: 24.0,
              ),
              RoundedButton(
                title: 'Log In',
                colour: Colors.lightBlueAccent,
                onPressed: () async {
                  setState(() {
                    showSpinner = true;
                  });
                  try {
                    final user = await _auth.signInWithEmailAndPassword(
                        email: email, password: password);
                    if (user != null) {
                      Navigator.pushNamed(context, LandingScreen.id);
                    }
                    setState(() {
                      showSpinner = false;
                    });
                  } catch (errorCode) {
                    FirebaseAuthHandler().handleErrorCodes(errorCode);
                    setState(() {
                      showSpinner = false;
                    });
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
