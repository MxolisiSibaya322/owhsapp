import 'package:flutter/material.dart';
import 'TypefSignUp.dart';
import 'TypeOfUser.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Orlando West High School',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Colors.black,

          // colorScheme: const ColorScheme.dark(primary : Colors.black),
          primarySwatch: Colors.yellow,
          splashColor: Colors.black),
      home: const LandingPage(),
    );
  }
}

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: 350,
            height: 350,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.yellow, // Set the color of the border outline
                width: 2.0, // Set the width of the border outline
              ),
            ),
            child: Image.asset(
              "assets/images/badge.png",
              width: 300,
              height: 300,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const TypeOfUser()),
                  );
                },
                child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.login_outlined),
                      Text(selectionColor: Colors.white, 'Login')
                    ]),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const TypeOfSignUp()),
                  );
                },
                child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.app_registration_outlined),
                      Text(selectionColor: Colors.white, 'Sign Up')
                    ]),
              ),
            ],
          )
        ],
      )),
    );
  }
}
