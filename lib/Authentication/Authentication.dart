import 'package:firebase_auth/firebase_auth.dart';

import 'ValidateLogin.dart';

final _auth = FirebaseAuth.instance;

String errMesssage = "";
String errLoginMessage = "";
String? userUID = "";
String signedInUID = "";

Future<UserCredential?> registerUser(String email, String password) async {
  UserCredential? user;
  try {
    user = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
  } on FirebaseAuthException catch (e) {
    errMesssage = e.code;
    // print("error: $errMesssage");
  }

  User? details = user?.user;

  userUID = details?.uid;

  return user;
}

Future<UserCredential?> signIn(String email, String password) async {
  UserCredential? user;
  try {
    user = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
  } on FirebaseAuthException catch (e) {
    errLoginMessage = e.code;
  }
  return user;
}

signOut() {
  loggedInUserDetails = {};
  _auth.signOut();
}
