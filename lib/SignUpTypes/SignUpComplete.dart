// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import '../DetailCollection/learnerDetailsCollection.dart';

import '../LoginPage.dart';

class SignUpComplete extends StatefulWidget {
  String type;
  String? names;
  String? surname;
  SignUpComplete(
      {super.key,
      required this.names,
      required this.surname,
      required this.type});

  @override
  State<SignUpComplete> createState() => _SignUpCompleteState();
}

class _SignUpCompleteState extends State<SignUpComplete> {
  late String _type;
  late String? _names;
  late String? _surname;
  @override
  void initState() {
    super.initState();
    _type = widget.type;
    _names = widget.names;
    _surname = widget.surname;
    _type = _type.toUpperCase();
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
        title: const Text(""),
      ),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Center(
                child: Text(
                  "CONGRATULATIONS!  ",
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
              ),
              const Center(
                  child: Text("You have signed up as",
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ))),
              Center(
                  child: Text("$_type : $_names $_surname",
                      style: const TextStyle(
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ))),
              Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.yellow, // Set the color of the border outline
                    width: 2.0, // Set the width of the border outline
                  ),
                ),
                child: Image.asset(
                  "assets/images/badge.png",
                  width: 100,
                  height: 100,
                ),
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  login(context, _type);
                },
                child: const Text('login'),
              ),
            ],
          )),
    );
  }
}
