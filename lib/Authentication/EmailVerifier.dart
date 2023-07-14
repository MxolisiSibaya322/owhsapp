// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:owhsapp/Authentication/Authentication.dart';
import 'package:owhsapp/DetailCollection/learnerDetailsCollection.dart';
// import 'package:owhsapp/DetailCollection/AdminDetailsCollection.dart';

import '../HoverTextButton.dart';
import '../SignUpTypes/SignUpComplete.dart';

class EmailVerifier extends StatefulWidget {
  String code;
  String type;
  Map<String, String> userDetails = {};
  EmailVerifier(
      {super.key,
      required this.code,
      required this.type,
      required this.userDetails});

  @override
  State<EmailVerifier> createState() => _EmailVerifierState();
}

class _EmailVerifierState extends State<EmailVerifier> {
  late String _code;
  late String _type;
  late Map<String, String> _userDetails;
  String actualCode = "";
  TextEditingController codeGetter = TextEditingController();
  @override
  void initState() {
    super.initState();
    _code = widget.code;
    _type = widget.type;
    _userDetails = widget.userDetails;
  }

  bool isCodeValid(String enteredCode, String actualCode) {
    return enteredCode == actualCode;
  }

  @override
  Widget build(BuildContext context) {
    String? emailUser = _userDetails['email'];
    return Scaffold(
      appBar: AppBar(
        title: const Text(""),
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
                const Center(
                  child: Text(
                    "Email Verification :",
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                ),
                const Center(
                    child: Text("A verification code was sent to ",
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontSize: 13,
                        ))),
                Center(
                    child: Text("$emailUser",
                        style: const TextStyle(
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                        ))),
                const Center(
                    child: Text("Enter the code below:",
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontSize: 13,
                        ))),
                const SizedBox(height: 8.0),
                Center(
                  child: SizedBox(
                    width: 100,
                    height: 50,
                    child: TextField(
                      controller: codeGetter,
                    ),
                  ),
                ),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      actualCode = codeGetter.text.trim().toLowerCase();
                      if (isCodeValid(_code, actualCode)) {
                        registerUser(
                            userDetails["email"], userDetails["password"]);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignUpComplete(
                                      names: _userDetails["name"],
                                      surname: _userDetails["surname"],
                                      type: _type,
                                    )));
                      }
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              content: const Text(
                                "The verification code does not match the one sent to your email",
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
                      codeGetter.clear();
                    },
                    child: const Text('Verify'),
                  ),
                ),
                Center(
                    child: HoverTextButton(
                  defaultStyle: const TextStyle(color: Colors.black),
                  hoverStyle: const TextStyle(color: Colors.yellow),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  text: 'Not your email? Re-enter email',
                ))
              ],
            ),
          )),
    );
  }
}
