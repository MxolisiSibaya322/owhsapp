import 'package:flutter/material.dart';
import 'package:owhsapp/Authentication/Authentication.dart';
import 'package:owhsapp/Authentication/ValidateLogin.dart';

import 'ListAllStudents.dart';
import 'ListAllTeachers.dart';

class AdminDashboard extends StatefulWidget {
  const AdminDashboard({super.key});

  @override
  State<AdminDashboard> createState() => _AdminDashboardState();
}

listAllStudents(BuildContext context) {
  Navigator.push(context,
      MaterialPageRoute(builder: (context) => const ListAllStudents()));
}

bottomButtons(BuildContext context) {
  return BottomAppBar(
    color: Colors.yellow,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(
          icon: const Icon(Icons.home),
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(
                context, '/dashboard', (route) => false);
          },
        ),
        IconButton(
          icon: const Icon(Icons.account_balance),
          onPressed: () {
            listAllStudents(context);
          },
        ),
        IconButton(
          icon: const Icon(Icons.group_outlined),
          onPressed: () {
            listAllTeachers(context);
          },
        ),
        IconButton(
          icon: const Icon(Icons.settings),
          onPressed: () {
            // Handle settings button tap here
          },
        ),
      ],
    ),
  );
}

class _AdminDashboardState extends State<AdminDashboard> {
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
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/login', (route) => false);
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
                                          Navigator.pushNamedAndRemoveUntil(
                                              context,
                                              '/login',
                                              (route) => false);
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
            bottomNavigationBar: bottomButtons(context),
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
                  Text(
                    "${loggedInUserDetails["DocName"].toString().toUpperCase()} : ${loggedInUserDetails["NAME"]} ${loggedInUserDetails["SURNAME"]}",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 10.3,
                        fontWeight: FontWeight.bold,
                        color: Colors.yellow),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 50),
                      DashboardButton(
                        label: 'Announcements',
                        context: context,
                      ),
                      DashboardButton(
                        label: 'Stats',
                        context: context,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 50),
                      DashboardButton(
                        label: 'Link',
                        context: context,
                      ),
                      DashboardButton(
                        label: 'Portal',
                        context: context,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            )));
  }
}

class DashboardButton extends StatelessWidget {
  final String label;
  final BuildContext context;
  void dashboardSelector(String label) {
    if (label == "Announcements") {}
    if (label == "Stats") {}
    if (label == "Link") {}
    if (label == "Portal") {}
  }

  // ignore: prefer_const_constructors_in_immutables
  DashboardButton({super.key, required this.label, required this.context});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ElevatedButton(
        onPressed: () {
          // Add functionality for each button
          dashboardSelector(label);
        },
        child: Text(label),
      ),
    );
  }
}

void listAllTeachers(BuildContext context) {
  Navigator.push(context,
      MaterialPageRoute(builder: (context) => const ListAllTeachers()));
}
