// ignore_for_file: use_build_context_synchronously, must_be_immutable

import 'package:flutter/material.dart';

import '../Authentication/EmailVerifier.dart';
import '../Authentication/PasswordStrength.dart';
import '../DetailCollection/TeacherDetailsCollection.dart';
import '../LoadingScreen.dart';

class TeacherSignUpPage extends StatefulWidget {
  String type;
  TeacherSignUpPage({super.key, required this.type});

  @override
  State<TeacherSignUpPage> createState() => _TeacherSignUpPageState();
}

class _TeacherSignUpPageState extends State<TeacherSignUpPage> {
  late String _type;
  bool isMatchingPassword = true;
  bool _obscureText = true;
  bool _obscureTextR = true;
  PasswordStrength passwordStrength = PasswordStrength.Weak;
  checkStrength(String value) {
    setState(() {
      passwordStrength = checkPasswordStrength(value);
    });
  }

  checkMatch(String value) {
    setState(() {
      isMatchingPassword = value == teacherPassword.text;
    });
  }

  @override
  void initState() {
    super.initState();
    _type = widget.type; // Access the title variable from the widget
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Teacher Sign Up'),
      ),
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
                TextField(
                  controller: teacherEmail,
                  decoration: const InputDecoration(
                    labelText: 'Email Address',
                  ),
                ),
                TextField(
                  controller: teacherPassword,
                  obscureText: _obscureText,
                  onChanged: checkStrength,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                      icon: _obscureText
                          ? const Icon(
                              Icons.visibility_outlined,
                            )
                          : const Icon(
                              Icons.visibility_off_outlined,
                            ),
                    ),
                    labelText: 'Password',
                  ),
                ),
                Text(
                  'Password Strength: ${passwordStrength.toString().split('.').last}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: getColorForPasswordStrength(passwordStrength),
                  ),
                ),
                TextField(
                  controller: teacherRepeatpassword,
                  onChanged: checkMatch,
                  obscureText: _obscureTextR,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _obscureTextR = !_obscureTextR;
                        });
                      },
                      icon: _obscureTextR
                          ? const Icon(Icons.visibility_outlined)
                          : const Icon(Icons.visibility_off_outlined),
                    ),
                    labelText: 'Repeat password',
                    errorText:
                        isMatchingPassword ? null : "passwords should match",
                  ),
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () async {
                    showDialog(
                      context: context,
                      builder: (context) => loading(context),
                    );

                    if (await isValidTeacher(context)) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EmailVerifier(
                                    userDetails: toJson(),
                                    code: codeGenerated,
                                    type: _type,
                                  )));
                    }
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
