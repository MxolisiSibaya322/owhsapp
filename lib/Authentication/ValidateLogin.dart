import 'package:flutter/material.dart';

import '../users/Admin/AdminDashboard.dart';
import '../users/Learner/LearnerDashboard.dart';
import '../users/Teacher/TeacherDashboard.dart';

final TextEditingController loginUsername = TextEditingController();
final TextEditingController loginPassword = TextEditingController();

String userType(String type) {
  type = type.toUpperCase();
  return "$type LOGIN";
}

bool validateLogin(String username, String password, String type) {
  if (type == "admin") {
    return doAdmin(username, password);
  } else if (type == "learner") {
    return dolearner(username, password);
  } else {
    return doteacher(username, password);
  }
}

bool doAdmin(String username, String password) {
  List<String> data = ["mxolisi.gojolo@gmail.com"];

  if (data.contains("mxolisi.gojolo@gmail.com") && password == "1234") {
    return true;
  }
  return false;
}

bool doteacher(String username, String password) {
  return false;
}

bool dolearner(String username, String password) {
  return false;
}

void isSuccessfulLogin(
    BuildContext context, String type, bool isCorrectDetails) {
  if (isCorrectDetails) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => loginType(type)),
    );
  } else {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: const Text(
              "Your username or password is incorrect",
              style: TextStyle(color: Colors.red),
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
