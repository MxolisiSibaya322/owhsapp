import 'package:flutter/material.dart';
import '../DetailCollection/AdminDetailsCollection.dart';

class AdminSignUpPage extends StatefulWidget {
  const AdminSignUpPage({super.key});

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
                      const SizedBox(height: 16.0),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            isLoading = true;
                            validateAdminDetails(context);
                          });
                          setState(() {
                            isLoading = false;
                          });

                          if (isValidAdmin(context)) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Placeholder()));
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
