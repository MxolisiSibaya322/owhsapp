import 'package:flutter/material.dart';

class SignUpPageB extends StatelessWidget {
  final TextEditingController _names = TextEditingController();
  final TextEditingController _surname = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _idNumber = TextEditingController();
  final TextEditingController _repeatpassword = TextEditingController();
  SignUpPageB({super.key});

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
                Image.asset(
                  "assets/images/badge.png",
                  width: 100,
                  height: 100,
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
                  controller: _names,
                  decoration: const InputDecoration(
                    labelText: 'Names (as they appear on ID)',
                  ),
                ),
                TextField(
                  controller: _surname,
                  decoration: const InputDecoration(
                    labelText: 'Surname',
                  ),
                ),
                TextField(
                  controller: _idNumber,
                  decoration: const InputDecoration(
                    labelText: 'ID number',
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
                TextField(
                  controller: _repeatpassword,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Repeat Password',
                  ),
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    String names = _names.text;
                    String surname = _surname.text;
                    String password = _password.text;
                    String repeatPassword = _repeatpassword.text;
                    String idNumber = _idNumber.text;
                  },
                  child: const Text('Sign Up'),
                ),
              ],
            ),
          )),
    );
  }
}
