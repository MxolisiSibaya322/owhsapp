import 'package:flutter/material.dart';

class SignUpPageB extends StatelessWidget {
  const SignUpPageB({super.key});

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
                const TextField(
                  decoration: InputDecoration(
                    labelText: 'Names (as they appear on ID)',
                  ),
                ),
                const TextField(
                  decoration: InputDecoration(
                    labelText: 'Surname',
                  ),
                ),
                const TextField(
                  decoration: InputDecoration(
                    labelText: 'ID number',
                  ),
                ),
                const SizedBox(height: 16.0),
                const TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                  ),
                ),
                const SizedBox(height: 16.0),
                const TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Repeat Password',
                  ),
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Sign Up'),
                ),
              ],
            ),
          )),
    );
  }
}
