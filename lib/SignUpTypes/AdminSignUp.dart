// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:owhsapp/Authentication/EmailVerifier.dart';
import '../Authentication/PasswordStrength.dart';
import '../DetailCollection/AdminDetailsCollection.dart';

// ignore: must_be_immutable
class AdminSignUpPage extends StatefulWidget {
  String type;
  AdminSignUpPage({super.key, required this.type});

  @override
  State<AdminSignUpPage> createState() => _AdminSignUpPageState();
}

Widget loadingPage() {
  return Container(
    width: 50,
    height: 50,
    decoration: const BoxDecoration(
      shape: BoxShape.circle,
      image: DecorationImage(
        image: AssetImage('assets/icons/badge_72.png'),
        fit: BoxFit.cover,
      ),
    ),
    child: const CircularProgressIndicator(
      strokeWidth: 4,
      valueColor: AlwaysStoppedAnimation<Color>(Colors.yellow),
    ),
  );
}

class _AdminSignUpPageState extends State<AdminSignUpPage> {
  late String _type;
  bool isMatchingPassword = true;
  PasswordStrength passwordStrength = PasswordStrength.Weak;
  checkMatch(String value) {
    setState(() {
      isMatchingPassword = value == password.text;
    });
  }

  void checkPassword(String value) {
    setState(() {
      passwordStrength = checkPasswordStrength(value);
    });
  }

  @override
  void initState() {
    super.initState();
    _type = widget.type;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Sign Up'),
      ),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: isLoading
                ? loadingPage()
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors
                                .yellow, // Set the color of the border outline
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
                        "Admin details : ",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.4,
                            fontStyle: FontStyle.italic),
                      ),
                      TextField(
                        controller: names,
                        decoration: const InputDecoration(
                          labelText: 'Names (as they appear on ID)',
                        ),
                      ),
                      TextField(
                        controller: surname,
                        decoration: const InputDecoration(
                          labelText: 'Surname',
                        ),
                      ),
                      TextField(
                        controller: idNumber,
                        decoration: const InputDecoration(
                          labelText: 'ID Number',
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      TextField(
                        controller: email,
                        decoration: const InputDecoration(
                          labelText: 'Email Address',
                        ),
                      ),
                      TextField(
                        controller: password,
                        obscureText: true,
                        onChanged: checkPassword,
                        decoration: const InputDecoration(
                          labelText: 'Password',
                        ),
                      ),
                      Text(
                        'Password Strength: ${passwordStrength.toString().split('.').last}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: getColorForPasswordStrength(passwordStrength),
                        ),
                      ),
                      TextField(
                        controller: repeatpassword,
                        obscureText: true,
                        onChanged: checkMatch,
                        decoration: InputDecoration(
                          labelText: 'Repeat password',
                          errorText: isMatchingPassword
                              ? null
                              : "passwords should match",
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      ElevatedButton(
                        onPressed: () async {
                          // setState(() {
                          //   isLoading = true;
                          // });
                          if (passwordStrength != PasswordStrength.Strong) {
                            await errorMessage(
                                context, "Please set a stronger paasword");
                            return;
                          }
                          if (!isMatchingPassword) {
                            await errorMessage(
                                context, "Passwords should match");
                            return;
                          }

                          if (await isValidAdmin(context)) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => EmailVerifier(
                                          userDetails: toJson(),
                                          code: codeGenerated,
                                          type: _type,
                                        )));
                          }
                        },
                        child: const Text('Sign Up'),
                      ),
                      const SizedBox(height: 16.0),
                    ],
                  ),
          )),
    );
  }
}
