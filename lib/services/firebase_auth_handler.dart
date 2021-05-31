import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthHandler {
  handleErrorCodes(FirebaseAuthException errorCode) {
    switch (errorCode.code) {
      case "wrong-password":
        print("Invalid password!!!");
        break;
      case "user-not-found":
        print("Invalid email address!!!");
        break;
    }
  }
}
