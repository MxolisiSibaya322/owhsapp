import 'package:flutter/material.dart';

final TextEditingController teacherNames = TextEditingController();
final TextEditingController teacherSurname = TextEditingController();
final TextEditingController teacherPassword = TextEditingController();
final TextEditingController teacherIdNumber = TextEditingController();
final TextEditingController teacherRepeatpassword = TextEditingController();
final TextEditingController teacherEmail = TextEditingController();

String tNames = "";
String tSurname = "";
String tPassword = "";
String tRepeatPass = "";
String tEmail = "";

errorMessage(BuildContext context, String err) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text(
            err,
            style: const TextStyle(color: Colors.red),
          ),
          actions: [
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("Try again"))
          ],
        );
      });
}

validateTeacher() {
  tNames = teacherNames.text.trim().toUpperCase();
  tSurname = teacherSurname.text.trim().toUpperCase();
  tPassword = teacherPassword.text.trim().toUpperCase();
  tRepeatPass = teacherRepeatpassword.text.trim().toUpperCase();
  tEmail = teacherEmail.text.trim().toUpperCase();
}
