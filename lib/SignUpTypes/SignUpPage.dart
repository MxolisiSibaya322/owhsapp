import 'package:flutter/material.dart';
import '../DetailCollection/learnerDetailsCollection.dart';
import 'SignUpPageB.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool isValidName = true;
  bool isValidSurname = true;
  bool isValidID = true;
  validateID(String id) {
    setState(() {
      isValidID = int.tryParse(id.trim()) != null;
    });
  }

  validateName(String value) {
    setState(() {
      isValidName = RegExp(r'^[a-zA-Z\s]*$').hasMatch(value.trim());
    });
  }
  // validateEmail(String value) {
  //   setState(() {
  //     isValidName = RegExp(r'^[a-zA-Z]+$').hasMatch(value);
  //   });
  // }

  validateSurname(String value) {
    setState(() {
      isValidSurname = RegExp(r'^[a-zA-Z\s]*$').hasMatch(value.trim());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Learner/Parent Sign Up'),
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
                  "Learner details : ",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.4,
                      fontStyle: FontStyle.italic),
                ),
                TextField(
                  controller: namess,
                  onChanged: validateName,
                  textCapitalization: TextCapitalization.characters,
                  decoration: InputDecoration(
                    labelText: 'Names (as they appear on ID)',
                    errorText: isValidName
                        ? null
                        : 'Name cannot have digits..unless you are Elon Musks child?',
                  ),
                ),
                TextField(
                  controller: surnames,
                  onChanged: validateSurname,
                  textCapitalization: TextCapitalization.characters,
                  decoration: InputDecoration(
                    labelText: 'Surname',
                    errorText: isValidSurname
                        ? null
                        : 'Surname cannot have digits..unless you are Elon Musks child?',
                  ),
                ),
                TextField(
                  controller: gradeController,
                  textCapitalization: TextCapitalization.characters,
                  decoration: const InputDecoration(
                    labelText: 'Grade',
                  ),
                ),
                TextField(
                  controller: idNumberController,
                  onChanged: validateID,
                  decoration: InputDecoration(
                    labelText: 'ID Number',
                    errorText:
                        isValidID ? null : 'ID number can only contain digits',
                  ),
                ),
                const SizedBox(height: 16.0),
                TextField(
                  controller: emailController,
                  // onChanged: isvalid,
                  decoration: const InputDecoration(
                    labelText: 'Email Address',
                  ),
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    validateInputA();
                    if (isValidA(context)) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignUpPageB()));
                    }
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
