import 'package:flutter/material.dart';
import 'package:owhsapp/Authentication/ValidateSignUp.dart';

final TextEditingController teacherNames = TextEditingController();
final TextEditingController teacherSurname = TextEditingController();
final TextEditingController teacherPassword = TextEditingController();
final TextEditingController teacherIdNumber = TextEditingController();
final TextEditingController teacherRepeatpassword = TextEditingController();
final TextEditingController teacherEmail = TextEditingController();

Map<String, dynamic> teachers = {};
Map<String, dynamic> teacherDetails = {};

String tNames = "";
String tSurname = "";
String tPassword = "";
String tRepeatPass = "";
String tEmail = "";
String teacherID = "";

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

validateTeacher() async {
  
}

Future<bool> isValidTeacher(BuildContext context) async {
  tNames = teacherNames.text.trim().toUpperCase();
  tSurname = teacherSurname.text.trim().toUpperCase();
  tPassword = teacherPassword.text.trim().toUpperCase();
  tRepeatPass = teacherRepeatpassword.text.trim().toUpperCase();
  tEmail = teacherEmail.text.trim().toUpperCase();
  teacherID = teacherIdNumber.text.trim().toUpperCase();
  teachers = await getTeachers();
  for (var teacher in teachers.values) {
    if (teacher["ID-NUMBER"].toString().toUpperCase() == teacherID) {
      teacherDetails = teacher;
    }
  }
  if (teacherDetails.isEmpty) {
    errorMessage(context,
        "ID Number: $teacherID does not match any of the registered teachers in Orlando West High");
    return false;
  }

  if (teacherDetails["NAME"] != tNames) {
    errorMessage(context,
        "the name(s) : $tNames do not match that of the teacher with ID number $teacherID");
    return false;
  }
  if (teacherDetails["SURNAME"] != tSurname) {
    errorMessage(context,
        "the surname : $tSurname do not match that of the teacher with ID number $teacherID");
    return false;
  }

  return true;
}
