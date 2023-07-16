import 'package:firebase_auth/firebase_auth.dart';

final _auth = FirebaseAuth.instance;
bool isAlreadyBeingUsed = false;
bool invalidEmailCreate = false;
bool invalidEmailSignIn = false;
bool weakPassword = false;
bool userNotFound = false;
bool wrongPassword = false;
bool userDisabled = false;
String errMesssage = "";
String? userUID = "";
String signedInUID = "";

void setUserType(User user, String userType) async {
  // UserUpdateInfo userUpdateInfo = UserUpdateInfo();
  // userUpdateInfo.displayName = user.displayName;
  // userUpdateInfo.photoUrl = user.photoURL;

  // Set custom user type field
  // userUpdateInfo.updateCustomData(<String, dynamic>{
  //   'userType': userType,
  // });

  // await user.;
  // print('User type set successfully: $userType');
}

Future<UserCredential?> registerUser(String email, String password) async {
  UserCredential? user;
  try {
    user = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
  } on FirebaseAuthException catch (e) {
    if (e.code == "email-already-in-use") {
      isAlreadyBeingUsed = true;
    }
    if (e.code == "invalid-email") {
      invalidEmailCreate = true;
    }
    if (e.code == "weak-password") {
      weakPassword = true;
    }

    errMesssage = e.code;
    // print("error: $errMesssage");
  }

  User? details = user?.user;

  userUID = details?.uid;

  return user;
}

signIn(String email, String password) async {
  try {
    await _auth.signInWithEmailAndPassword(email: email, password: password);
  } on FirebaseAuthException catch (e) {
    if (e.code == "user-disabled") {
      userDisabled = true;
    }
    if (e.code == "invalid-email") {
      invalidEmailSignIn = true;
    }
    if (e.code == "user-not-found") {
      userNotFound = true;
    }
    if (e.code == "wrong-password") {
      wrongPassword = true;
    }
  }
}

signOut() {
  _auth.signOut();
}
