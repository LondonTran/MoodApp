import 'package:flutter/material.dart';
import 'package:mood/screens/landing_screen.dart';
import 'package:mood/constants.dart';
import 'package:mood/services/user_setup.dart';
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
  String errorMessage = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                decoration: kTextFieldDecoration.copyWith(
                    hintText: 'Email',
                    hintStyle: TextStyle(
                      color: Colors.grey,
                    )),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Colors.grey,
                ),
                onChanged: (value) {
                  username = value;
                },
                decoration: kTextFieldDecoration.copyWith(
                    hintText: 'Username',
                    hintStyle: TextStyle(
                      color: Colors.grey,
                    )),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                obscureText: true,
                textAlign: TextAlign.left,
                onChanged: (value) {
                  password = value;
                },
                decoration: kTextFieldDecoration.copyWith(
                    hintText: 'Password',
                    hintStyle: TextStyle(
                      color: Colors.grey,
                    )),
              ),
              SizedBox(
                height: 24.0,
              ),
              Text(
                errorMessage,
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
              RoundedButton(
                title: 'Register',
                colour: Colors.blueAccent,
                onPressed: () async {
                  setState(() {
                    showLoadingIcon = true;
                  });
                  try {
                    errorMessage = "";
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
                    setState(() {
                      errorMessage =
                          FirebaseAuthErrorHandler().handleErrorCodes(error);
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
