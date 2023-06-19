import 'package:flutter/material.dart';

String userType(String type) {
  type = type.toUpperCase();
  return "$type LOGIN";
}

class LoginPage extends StatelessWidget {
  final String type;

  const LoginPage({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(userType(type)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/badge.png",
              width: 150,
              height: 150,
            ),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Username',
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
            ElevatedButton(
              onPressed: () {
                // Perform login logic here
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        content: const Text(
                          "Your username or password is incorrect",
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
              },
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
