import 'package:flutter/material.dart';
import 'package:mood/screens/welcome_screen.dart';
import 'package:mood/screens/login_screen.dart';
import 'package:mood/screens/registration_screen.dart';
import 'package:mood/screens/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MoodApp());
}

class MoodApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        LandingScreen.id: (context) => LandingScreen(),
      },
    );
  }
}
