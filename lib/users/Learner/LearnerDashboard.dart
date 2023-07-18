import 'package:flutter/material.dart';
import 'package:owhsapp/Authentication/ValidateLogin.dart';
import 'package:owhsapp/users/Learner/ViewMarks.dart';

import '../../Authentication/Authentication.dart';

class LearnerDashboard extends StatelessWidget {
  const LearnerDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Log out of the App?'),
            content: const Text('Are you sure you want to log out?'),
            actions: [
              TextButton(
                child: const Text('Yes'),
                onPressed: () {
                  signOut();
                  Navigator.of(context).pop(true);
                  Navigator.of(context).pop(true);
                },
              ),
              TextButton(
                child: const Text('No'),
                onPressed: () => Navigator.of(context).pop(false),
              ),
            ],
          ),
        );

        // By default, prevent back navigation until the user confirms
        return true;
      },
      child: Scaffold(
          appBar: AppBar(
            title: const Center(
              child: Text('Dashboard'),
            ),
            actions: <Widget>[
              PopupMenuButton(
                icon: const Icon(
                  Icons.person_2_rounded,
                ),
                itemBuilder: (BuildContext context) {
                  return [
                    const PopupMenuItem(
                      value: 'profile',
                      child: Text('Profile'),
                    ),
                    const PopupMenuItem(
                      value: 'settings',
                      child: Text('Settings'),
                    ),
                    const PopupMenuItem(
                      value: 'logout',
                      child: Text('Logout'),
                    ),
                  ];
                },
                onSelected: (value) {
                  if (value == 'profile') {
                    // Handle profile option
                    print('Profile option selected');
                  } else if (value == 'settings') {
                    // Handle settings option
                    print('Settings option selected');
                  } else if (value == 'logout') {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AlertDialog(
                                  title: const Text('Log out of the App?'),
                                  content: const Text(
                                      'Are you sure you want to log out?'),
                                  actions: [
                                    TextButton(
                                      child: const Text('Yes'),
                                      onPressed: () {
                                        signOut();
                                        Navigator.of(context).pop(true);
                                        Navigator.of(context).pop(true);
                                      },
                                    ),
                                    TextButton(
                                      child: const Text('No'),
                                      onPressed: () =>
                                          Navigator.of(context).pop(false),
                                    ),
                                  ],
                                )));
                  }
                },
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
                Text(
                  "WELCOME ${loggedInUserDetails["NAME"]}!",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
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
          )),
    );
  }
}

class DashboardButton extends StatelessWidget {
  final String label;

  const DashboardButton({super.key, required this.label});
  void dashboardSelector(String label, BuildContext context) {
    if (label == "Announcements") {}
    if (label == "View Marks") {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ViewMarks()),
      );
    }
    if (label == "TimeTable") {}
    if (label == "Learner Portal") {}
    if (label == "Resources") {}
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ElevatedButton(
        onPressed: () {
          // Add functionality for each button
          dashboardSelector(label, context);
        },
        child: Text(label),
      ),
    );
  }
}
