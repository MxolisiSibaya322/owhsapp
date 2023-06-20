import 'package:flutter/material.dart';
import 'SignUpPageB.dart';

class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
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
              "Learner details : ",
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
                labelText: 'ID Number',
              ),
            ),
            const SizedBox(height: 16.0),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Email Address',
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignUpPageB()),
                );
              },
              child: const Text('Continue'),
            ),
            const SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }
}
