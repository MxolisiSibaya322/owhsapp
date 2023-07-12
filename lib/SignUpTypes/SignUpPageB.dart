import 'package:flutter/material.dart';
import '../DetailCollection/learnerDetailsCollection.dart';
import '../LoginPage.dart';

class SignUpPageB extends StatelessWidget {
  const SignUpPageB({super.key});
  void login(BuildContext context, String typeName) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => LoginPage(
                type: typeName,
              )),
    );
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
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Repeat Password',
                  ),
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    validateInputB();
                    if (isValidB(context)) {
                      login(context, "learner");
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
