class FirebaseAuthHandler {
  FirebaseAuthHandler(this.errorCode);

  String errorCode;

  handleErrorCodes() {
    print("ERROR CODE:");
    print(errorCode);
  }
}
