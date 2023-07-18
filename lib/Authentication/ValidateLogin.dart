// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:owhsapp/Authentication/ValidateSignUp.dart';

import '../users/Admin/AdminDashboard.dart';
import '../users/Learner/LearnerDashboard.dart';
import '../users/Teacher/TeacherDashboard.dart';
import 'Authentication.dart';

final TextEditingController loginUsername = TextEditingController();
final TextEditingController loginPassword = TextEditingController();
Map<String, dynamic> admins = {};
Map<String, dynamic> teachers = {};
Map<String, dynamic> allStudent = {};
String username = "";
String password = "";
Map<String, dynamic> loggedInUserDetails = {};
late bool isCorrectDetails;
String userType(String type) {
  type = type.toUpperCase();
  return "$type LOGIN";
}

_errorMessage(BuildContext context, String err) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text(
            err,
            style: const TextStyle(color: Colors.red),
          ),
          actions: [
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("Try again"))
          ],
        );
      });
}

Future<bool> validateLogin(String type, BuildContext context) async {
  username = loginUsername.text.trim();
  password = loginPassword.text.trim();

  if (type == "admin") {
    isCorrectDetails = await doAdmin(username, password, context, type);
  } else if (type == "learner") {
    isCorrectDetails = await dolearner(username, password, context, type);
  } else {
    isCorrectDetails = await doteacher(username, password, context, type);
  }
  
  errLoginMessage = "";
  isSuccessfulLogin(context, type, isCorrectDetails);

  return true;
}

Future<bool> doAdmin(
    String username, String password, BuildContext context, String type) async {
  admins = await getAdmins();

  UserCredential? user = await signIn(username, password);
  Navigator.of(context).pop();
  if (errLoginMessage != "") {
    if (errLoginMessage == "unknown") {
      _errorMessage(context, "Your username or password is incorrect");
      return false;
    }
    _errorMessage(context, errLoginMessage);
    return false;
  }

  for (var entry in admins.entries) {
    if (entry.value["EMAIL"] == username) {
      loggedInUserDetails = entry.value;
      break;
    }
  }

  if (user?.user?.uid == loggedInUserDetails["UID"]) {
    return true;
  }

  _errorMessage(context,
      "ERROR! Check if you are signing in as the correct type of user.");

  return false;
}

Future<bool> doteacher(
    String username, String password, BuildContext context, String type) async {
  teachers = await getTeachers();
  UserCredential? user = await signIn(username, password);
  Navigator.of(context).pop();
  if (errLoginMessage != "") {
    if (errLoginMessage == "unknown") {
      _errorMessage(context, "Your username or password is incorrect");
      return false;
    }
    _errorMessage(context, errLoginMessage);
    return false;
  }

  for (var teacher in teachers.values) {
    if (teacher["EMAIL"] == username) {
      loggedInUserDetails = teacher.value;
      break;
    }
  }

  if (user?.user?.uid == loggedInUserDetails["UID"]) {
    return true;
  }

  _errorMessage(context,
      "ERROR! Check if you are signing in as the correct type of user.");
  return false;
}

Future<bool> dolearner(
    String username, String password, BuildContext context, String type) async {
  allStudent = await getAllStudents();
  UserCredential? user = await signIn(username, password);
  Navigator.of(context).pop();
  if (errLoginMessage != "") {
    if (errLoginMessage == "unknown") {
      _errorMessage(context, "Your username or password is incorrect");
      return false;
    }
    _errorMessage(context, errLoginMessage);
    return false;
  }
  for (var student in allStudent.values) {
    if (student["EMAIL"] == username) {
      loggedInUserDetails = student;
      break;
    }
  }

  if (user?.user?.uid == loggedInUserDetails["UID"]) {
    return true;
  }

  _errorMessage(context,
      "ERROR! Check if you are signing in as the correct type of user.");
  return false;
}

void isSuccessfulLogin(
    BuildContext context, String type, bool isCorrectDetails) {
  if (isCorrectDetails) {
    loginPassword.clear();
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => loginType(type)),
    );
  }
}

Widget loginType(String type) {
  if (type == "admin") {
    return const AdminDashboard();
  }
  if (type == "learner") {
    return const LearnerDashboard();
  } else {
    return const TeacherDashboard();
  }
}
