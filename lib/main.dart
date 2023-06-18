import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login or Sign Up',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.black,

        // colorScheme: const ColorScheme.dark(primary : Colors.black),
        primarySwatch: Colors.yellow,
      ),
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
    // TODO: Build the landing page UI
    return Scaffold(
    
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            "assets/images/badge.png",
            width: 400,
            height: 400,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () {
                  // TODO: Handle login button press
                },
                style: ButtonStyle(
                    fixedSize: MaterialStateProperty.all(const Size(200, 10))),
                child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.person_outline),
                      Text(selectionColor: Colors.white, 'Login')
                    ]),
              ),
              ElevatedButton(
                onPressed: () {
                  // TODO: Handle sign-up button press
                },
                style: ButtonStyle(
                    fixedSize: MaterialStateProperty.all(const Size(200, 10))),
                child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.person_outline),
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
