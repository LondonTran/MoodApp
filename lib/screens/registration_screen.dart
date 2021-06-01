import 'package:flutter/material.dart';
import 'package:mood/screens/landing_screen.dart';
import 'package:mood/constants.dart';
import 'package:mood/services/firebase.dart';
import 'package:mood/components/rounded_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mood/services/firebase_auth_error_handler.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class RegistrationScreen extends StatefulWidget {
  static const String id = 'registration_screen';
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;
  bool showLoadingIcon = false;
  String email;
  String username;
  String password;
  String signInError = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: ModalProgressHUD(
        inAsyncCall: showLoadingIcon,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Center(
                child: Text('Register',
                    style: TextStyle(
                      fontSize: 60,
                      color: Colors.white,
                    )),
              ),
              SizedBox(
                height: 48.0,
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                ),
                onChanged: (value) {
                  email = value;
                },
                decoration: kTextFieldDecoration.copyWith(
                    hintText: 'Enter your email',
                    hintStyle: TextStyle(
                      color: Colors.white,
                    )),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                ),
                onChanged: (value) {
                  username = value;
                },
                decoration: kTextFieldDecoration.copyWith(
                    hintText: 'Enter your username',
                    hintStyle: TextStyle(
                      color: Colors.white,
                    )),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                obscureText: true,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  password = value;
                },
                decoration: kTextFieldDecoration.copyWith(
                    hintText: 'Enter your password',
                    hintStyle: TextStyle(
                      color: Colors.white,
                    )),
              ),
              SizedBox(
                height: 24.0,
              ),
              RoundedButton(
                title: 'Register',
                colour: Colors.blueAccent,
                onPressed: () async {
                  setState(() {
                    showLoadingIcon = true;
                  });
                  try {
                    final newUser = await _auth.createUserWithEmailAndPassword(
                        email: email, password: password);
                    if (newUser != null) {
                      userSetup(username);
                      Navigator.pushNamed(context, LandingScreen.id);
                    }
                    if (newUser == null) {
                      print("User already exists");
                    }
                    setState(() {
                      showLoadingIcon = false;
                    });
                  } catch (error) {
                    signInError =
                        FirebaseAuthErrorHandler().handleErrorCodes(error);
                    setState(() {
                      showLoadingIcon = false;
                    });
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
