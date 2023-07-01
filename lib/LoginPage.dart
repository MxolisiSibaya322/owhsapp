import 'package:flutter/material.dart';
import 'Learner/LearnerDashboard.dart';
import 'Admin/AdminDashboard.dart';
import 'Teacher/TeacherDashboard.dart';

String userType(String type) {
  type = type.toUpperCase();
  return "$type LOGIN";
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

bool validateLogin(String username, String password, String type) {
  return true;
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

class LoginPage extends StatelessWidget {
  final String type;
  final TextEditingController _userName = TextEditingController();
  final TextEditingController _password = TextEditingController();
  LoginPage({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(userType(type)),
      ),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/badge.png",
                  width: 150,
                  height: 150,
                ),
                TextField(
                  controller: _userName,
                  decoration: const InputDecoration(
                    labelText: 'Username',
                  ),
                ),
                const SizedBox(height: 16.0),
                TextField(
                  controller: _password,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                  ),
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    String username = _userName.text.trim();
                    String password = _password.text;
                    // Perform login logic here
                    bool isCorrectDetails =
                        validateLogin(username, password, type);
                    _userName.clear();
                    _password.clear();
                    isSuccessfulLogin(context, type, isCorrectDetails);
                  },
                  child: const Text('Login'),
                ),
              ],
            ),
          )),
    );
  }
}
