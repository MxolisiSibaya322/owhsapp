// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:owhsapp/Authentication/EmailVerifier.dart';

import '../Authentication/PasswordStrength.dart';
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

  PasswordStrength passwordStrength = PasswordStrength.Weak;

  @override
  void initState() {
    super.initState();
    _type = widget.type;
  }

  void checkPassword(String value) {
    setState(() {
      passwordStrength = checkPasswordStrength(value);
    });
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

  bool _obscureText = true;
  bool _obscureTextR = true;
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
                  onChanged: checkPassword,
                  obscureText: _obscureText,
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
                const SizedBox(height: 16.0),
                Text(
                  'Password Strength: ${passwordStrength.toString().split('.').last}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: getColorForPasswordStrength(passwordStrength),
                  ),
                ),
                TextField(
                  controller: repeatpasswordController,
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
                      labelText: 'Repeat Password',
                      errorText:
                          isMatchingPassword ? null : "passwords should match"),
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () async {
                    if (passwordStrength != PasswordStrength.Strong) {
                      await errorMessage(
                          context, "Please set a stronger paasword");
                      return;
                    }
                    if (!isMatchingPassword) {
                      await errorMessage(context, "Passwords should match");
                      return;
                    }
                    if (isValidB(context)) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EmailVerifier(
                                    code: codeGenerated,
                                    userDetails: toJson(),
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
