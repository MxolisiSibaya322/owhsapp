// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

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
      appBar: AppBar(
        title: const Text('Landing Page'),
      ),
      body: const Center(
        // TODO: Add login and sign-up UI components
        child: Text('Login or Sign Up'),
      ),
    );
  }
}
