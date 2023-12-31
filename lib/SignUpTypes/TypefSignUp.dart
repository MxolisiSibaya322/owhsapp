// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:owhsapp/SignUpTypes/AdminSignUp.dart';
import 'package:owhsapp/SignUpTypes/TeacherSignUp.dart';

import 'SignUpPage.dart';
import '../HoverTextButton.dart';

class TypeOfSignUp extends StatelessWidget {
  const TypeOfSignUp({super.key});

  Widget checkType(BuildContext context, String typeName) {
    if (typeName == "learner") {
      return SignUpPage(type: typeName);
    }
    if (typeName == "admin") {
      return AdminSignUpPage(
        type: typeName,
      );
    }
    if (typeName == "teacher") {
      return TeacherSignUpPage(
        type: typeName,
      );
    } else {
      return SignUpPage(type: typeName);
    }
  }

  void signUp(BuildContext context, String typeName) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => checkType(context, typeName)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(
              child: Text(
                "SIGNUP AS : ",
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            Align(
                alignment: Alignment.topCenter,
                child: Center(
                  child: Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors
                            .yellow, // Set the color of the border outline
                        width: 2.0, // Set the width of the border outline
                      ),
                    ),
                    child: Image.asset(
                      "assets/images/badge.png",
                      width: 100,
                      height: 100,
                    ),
                  ),
                )),
            const SizedBox(height: 20.0),
            Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // const SizedBox(height: 16.0),
                    ElevatedButton(
                        onPressed: () {
                          signUp(context, "learner");
                        },
                        child: const Text(
                          "Learner/\nGuardian",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                    // const SizedBox(height: 16.0),
                    ElevatedButton(
                        onPressed: () {
                          signUp(context, "admin");
                        },
                        child: const Text(
                          "Admin",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                    // const SizedBox(height: 16.0),
                    ElevatedButton(
                        onPressed: () {
                          signUp(context, "teacher");
                        },
                        child: const Text(
                          "Teacher",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                  ],
                ),
                const SizedBox(height: 50.0),
              ],
            ))
          ],
        ),
      ),
      persistentFooterButtons: [
        Center(
            child: HoverTextButton(
          defaultStyle: const TextStyle(color: Colors.black),
          hoverStyle: const TextStyle(color: Colors.yellow),
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(
                context, '/logInType', (route) => false);
          },
          text: 'Already have an account? Log In',
        ))
      ],
    );
  }
}
