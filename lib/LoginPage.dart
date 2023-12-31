import 'package:flutter/material.dart';

import 'Authentication/ValidateLogin.dart';

import 'LoadingScreen.dart';

class LoginPage extends StatefulWidget {
  final String type;

  const LoginPage({super.key, required this.type});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

late String _type;
String getType() {
  return _type;
}

class _LoginPageState extends State<LoginPage> {
  bool _obscureText = true;
  @override
  void initState() {
    super.initState();
    _type = widget.type.toLowerCase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(userType(_type)),
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
                ElevatedButton(
                  onPressed: () async {
                    showDialog(
                      context: context,
                      builder: (context) => loading(context),
                    );

                    await validateLogin(_type, context);
                  },
                  child: const Text('Login'),
                ),
              ],
            ),
          )),
      persistentFooterButtons: [
        Center(
            child: TextButton(
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(
                context, '/landing', (route) => false);
          },
          child: const Icon(
            Icons.home_outlined,
            color: Colors.black,
          ),
        ))
      ],
    );
  }
}
