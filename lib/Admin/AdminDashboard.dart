import 'package:flutter/material.dart';

class AdminDashboard extends StatelessWidget {
  const AdminDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text('Dashboard'),
          ),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                // Add functionality to view profile
              },
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(20),
              ),
              child: const Icon(Icons.person),
            ),
          ],
        ),
        extendBody: true,
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/background.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/badge.png",
                width: 150,
                height: 150,
              ),
              const Text(
                "WELCOME!",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 20.3,
                    fontWeight: FontWeight.bold,
                    color: Colors.yellow),
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 50),
                  DashboardButton(label: 'Announcements'),
                  DashboardButton(label: 'View Marks'),
                ],
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 50),
                  DashboardButton(label: 'TimeTable'),
                  DashboardButton(label: 'Learner Portal'),
                ],
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DashboardButton(label: 'Resources'),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ));
  }
}

class DashboardButton extends StatelessWidget {
  final String label;

  const DashboardButton({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ElevatedButton(
        onPressed: () {
          // Add functionality for each button
        },
        child: Text(label),
      ),
    );
  }
}
