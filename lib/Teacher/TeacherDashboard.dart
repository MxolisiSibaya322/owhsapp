import 'package:flutter/material.dart';

class TeacherDashboard extends StatelessWidget {
  const TeacherDashboard({super.key});

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
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 50),
              DashboardButton(label: 'Announcements'),
              DashboardButton(label: 'View Marks'),
              DashboardButton(label: 'Resources'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 50),
              DashboardButton(label: 'TimeTable'),
              DashboardButton(label: 'Learner Portal'),
            ],
          ),
          SizedBox(height: 20),
        ],
      ),
    );
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
