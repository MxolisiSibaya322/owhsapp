import 'package:flutter/material.dart';
import 'Authentication/ValidateLogin.dart';

class LoginPage extends StatefulWidget {
  final String type;

  LoginPage({super.key, required this.type});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late String type;

  @override
  void initState() {
    super.initState();
    type = widget.type;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(userType(type)),
      ),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
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
                TextField(
                  controller: loginUsername,
                  decoration: const InputDecoration(
                    labelText: 'Username',
                  ),
                ),
                const SizedBox(height: 16.0),
                TextField(
                  controller: loginPassword,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                  ),
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    String username = loginUsername.text.trim();
                    String password = loginPassword.text;
                    // Perform login logic here
                    bool isCorrectDetails =
                        validateLogin(username, password, type);
                    // _userName.clear();
                    loginPassword.clear();
                    isSuccessfulLogin(context, type, isCorrectDetails);
                  },
                  child: const Text('Login'),
                ),
              ],
            ),
          )),
    );
  }
}
