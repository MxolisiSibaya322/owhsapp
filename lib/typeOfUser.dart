import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'LoginPage.dart';

class typeOfUser extends StatelessWidget {
  const typeOfUser({super.key});

  void login(BuildContext context, String type) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 150.0),
              const Align(
                alignment: Alignment.topCenter,
                child: Text(
                  "Log in as a : ",
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
              ),
              const SizedBox(height: 100.0),
              Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center ,
                children: [
                  // Image.asset(
                  //   "assets/images/badge.png",
                  //   width: 90,
                  //   height: 90,
                  // ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const SizedBox(height: 16.0),
                      ElevatedButton(
                          onPressed: () {
                            login(context, "learner");
                          },
                          child: const Text(
                            "Learner/Parent",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )),
                      const SizedBox(height: 16.0),
                      ElevatedButton(
                          onPressed: () {
                            login(context, "admin");
                          },
                          child: const Text(
                            "Admin",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )),
                      const SizedBox(height: 16.0),
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
                ],
              ))
            ],
          ),
        ));
  }
}
