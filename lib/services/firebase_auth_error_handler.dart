import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthErrorHandler {
  String errorMessage = "";
  handleErrorCodes(FirebaseAuthException error) {
    switch (error.code) {
      case "invalid-email":
        print("Invalid email address.");
        errorMessage = "Invalid email address.";
        break;
      case "user-disabled":
        print("Account disabled!");
        errorMessage = "Account disabled.";
        break;
      case "user-not-found":
        print("User not found.");
        errorMessage = "User not found.";
        break;
      case "wrong-password":
        print("Invalid password.");
        errorMessage = "Invalid password.";
        break;
      case "email-already-in-use":
        print("Email already in use.");
        errorMessage = "Email already in use.";
        break;
      case "operation-not-allowed":
        print("Operation not allowed");
        errorMessage = "Operation not allowed.";
        break;
      case "weak-password":
        print("Weak password.");
        errorMessage = "Weak password";
        break;
    }
    return errorMessage;
  }
}
