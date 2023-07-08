import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:owhsapp/SignUpTypes/AdminSignUp.dart';
import 'package:owhsapp/SignUpTypes/TeacherSignUp.dart';
import '../TypeOfUser.dart';
import 'SignUpTypes/SignUpPage.dart';
import 'HoverTextButton.dart';

class TypeOfSignUp extends StatelessWidget {
  const TypeOfSignUp({super.key});

  Widget checkType(BuildContext context, String typeName) {
    if (typeName == "learner") {
      return SignUpPage();
    }
    if (typeName == "admin") {
      return AdminSignUpPage();
    }
    if (typeName == "teacher") {
      return  TeacherSignUpPage();
    } else {
      return SignUpPage();
    }
  }

  void login(BuildContext context, String typeName) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => checkType(context, typeName)),
    );
  }

  hoverBlue(PointerHoverEvent event) {
    // setState(() {
    //   child = Colors.red;
    //   x = details.position.dx;
    //   y = details.position.dy;
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 150.0),
            const Align(
                alignment: Alignment.topCenter,
                child: Center(
                  child: Text(
                    "Sign up as : ",
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                )),
            const SizedBox(height: 100.0),
            Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // const SizedBox(height: 16.0),
                    ElevatedButton(
                        onPressed: () {
                          login(context, "learner");
                        },
                        child: const Text(
                          "Learner/\nGuardian",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                    // const SizedBox(height: 16.0),
                    ElevatedButton(
                        onPressed: () {
                          login(context, "admin");
                        },
                        child: const Text(
                          "Admin",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                    // const SizedBox(height: 16.0),
                    ElevatedButton(
                        onPressed: () {
                          login(context, "teacher");
                        },
                        child: const Text(
                          "Teacher",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                  ],
                ),
                const SizedBox(height: 150.0),
              ],
            ))
          ],
        ),
      ),
      persistentFooterButtons: [
        Center(
            child: HoverTextButton(
          defaultStyle: const TextStyle(color: Colors.black),
          hoverStyle: const TextStyle(color: Colors.yellow),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const TypeOfUser()),
            );
          },
          text: 'Already have an account? Log In',
        )

            //   TextButton(
            //   // ignore: avoid_types_as_parameter_names
            //   onHover: (bool) {
            //     bool ? Colors.blue : Colors.black;
            //   },
            //   onPressed: () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => const TypeOfUser()),
            // );
            //   },
            //   child:const  Text(
            //     'Already have an account? Log In',
            //     style: TextStyle(color: Colors.black),
            //   ),
            // ),
            )
      ],
    );
  }
}
