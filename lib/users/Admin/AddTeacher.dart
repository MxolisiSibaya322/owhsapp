import 'package:flutter/material.dart';

import '../../DetailCollection/TeacherDetailsCollection.dart';
import '../../LoadingScreen.dart';
import 'AdminDashboard.dart';

class AddTeacher extends StatefulWidget {
  const AddTeacher({super.key});

  @override
  State<AddTeacher> createState() => _AddTeacherState();
}

class _AddTeacherState extends State<AddTeacher> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: bottomButtons(context),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color:
                          Colors.yellow, // Set the color of the border outline
                      width: 2.0, // Set the width of the border outline
                    ),
                  ),
                  child: Image.asset(
                    "assets/images/badge.png",
                    width: 100,
                    height: 100,
                  ),
                ),
                const Text(
                  "Teacher details : ",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.4,
                      fontStyle: FontStyle.italic),
                ),
                TextField(
                  controller: teacherNames,
                  decoration: const InputDecoration(
                    labelText: 'Names (as they appear on ID)',
                  ),
                ),
                TextField(
                  controller: teacherSurname,
                  decoration: const InputDecoration(
                    labelText: 'Surname',
                  ),
                ),
                TextField(
                  controller: teacherIdNumber,
                  decoration: const InputDecoration(
                    labelText: 'ID Number',
                  ),
                ),
                const SizedBox(height: 16.0),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () async {
                    // showDialog(
                    //   context: context,
                    //   builder: (context) => loading(context),
                    // );
                  },
                  child: const Text('Sign Up'),
                ),
                const SizedBox(height: 16.0),
              ],
            ),
          )),
    );
  }
}
