// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:owhsapp/SignUpTypes/SignUpComplete.dart';
import '../DetailCollection/learnerDetailsCollection.dart';
import '../LoginPage.dart';

class SignUpPageB extends StatefulWidget {
  String type;
  String names;
  String surname;
  SignUpPageB(
      {super.key,
      required this.names,
      required this.surname,
      required this.type});

  @override
  State<SignUpPageB> createState() => _SignUpPageBState();
}

class _SignUpPageBState extends State<SignUpPageB> {
  late String _type;
  late String _names;
  late String _surname;
  @override
  void initState() {
    super.initState();
    _type = widget.type;
    _names = widget.names;
    _surname = widget.surname;
  }

  void login(BuildContext context, String typeName) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => LoginPage(
                type: typeName,
              )),
    );
  }

  bool isMatchingPassword = true;
  checkMatch(String value) {
    setState(() {
      isMatchingPassword = value == passwordController.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Learner/Parent Sign Up Cont.'),
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
                  "Guardian details : ",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.4,
                      fontStyle: FontStyle.italic),
                ),
                TextField(
                  controller: gnamesController,
                  decoration: const InputDecoration(
                    labelText: 'Names (as they appear on ID)',
                  ),
                ),
                TextField(
                  controller: gsurnameController,
                  decoration: const InputDecoration(
                    labelText: 'Surname',
                  ),
                ),
                const SizedBox(height: 16.0),
                TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                  ),
                ),
                const SizedBox(height: 16.0),
                TextField(
                  controller: repeatpasswordController,
                  onChanged: checkMatch,
                  obscureText: true,
                  decoration: InputDecoration(
                      labelText: 'Repeat Password',
                      errorText:
                          isMatchingPassword ? null : "passwords should match"),
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    if (isValidB(context)) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignUpComplete(
                                    names: _names,
                                    surname: _surname,
                                    type: _type,
                                  )));
                    }
                  },
                  child: const Text('Sign Up'),
                ),
              ],
            ),
          )),
    );
  }
}
