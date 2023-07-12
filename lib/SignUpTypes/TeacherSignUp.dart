import 'package:flutter/material.dart';

class TeacherSignUpPage extends StatelessWidget {
  TeacherSignUpPage({super.key});
  final TextEditingController _names = TextEditingController();
  final TextEditingController _surname = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _idNumber = TextEditingController();
  final TextEditingController _repeatpassword = TextEditingController();
  final TextEditingController _email = TextEditingController();
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
                    labelText: 'ID Number',
                  ),
                ),
                const SizedBox(height: 16.0),
                TextField(
                  controller: _email,
                  decoration: const InputDecoration(
                    labelText: 'Email Address',
                  ),
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    String names = _names.text;
                    String surname = _surname.text;
                    String password = _password.text;
                    String repeatPassword = _repeatpassword.text;
                    String email = _email.text;
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Text("welcome")),
                    );
                  },
                  child: const Text('Continue'),
                ),
                const SizedBox(height: 16.0),
              ],
            ),
          )),
    );
  }
}
