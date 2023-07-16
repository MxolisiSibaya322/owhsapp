// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:owhsapp/Authentication/ValidateSignUp.dart';
import 'package:random_string/random_string.dart';

import '../MailSender.dart';

final TextEditingController teacherNames = TextEditingController();
final TextEditingController teacherSurname = TextEditingController();
final TextEditingController teacherPassword = TextEditingController();
final TextEditingController teacherIdNumber = TextEditingController();
final TextEditingController teacherRepeatpassword = TextEditingController();
final TextEditingController teacherEmail = TextEditingController();

Map<String, dynamic> teachers = {};
Map<String, dynamic> teacherDetails = {};
String codeGenerated = randomAlphaNumeric(7);

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

Future<bool> isValidTeacher(BuildContext context) async {
  tNames = teacherNames.text.trim().toUpperCase();
  tSurname = teacherSurname.text.trim().toUpperCase();
  tPassword = teacherPassword.text;
  tRepeatPass = teacherRepeatpassword.text;
  tEmail = teacherEmail.text.trim();
  teacherID = teacherIdNumber.text.trim().toUpperCase();
  teachers = await getTeachers();
  for (var teacher in teachers.values) {
    teacherDetails = teacher;
    teacherDetails["PASSWORD"] = tPassword;
    teacherDetails["EMAIL"] = tEmail;
    if (teacher["ID-NUMBER"].toString().toUpperCase() == teacherID) {
      for (var entry in teachers.entries) {
        if (entry.value["ID-NUMBER"] == teacherID) {
          teacherDetails["DocName"] = entry.key;
          break;
        }
      }

      break;
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
  sendVerificationCode(tEmail, codeGenerated);
  if (errMessageMailSender == "") {
    return true;
  } else {
    errorMessage(context, errMessageMailSender);
    return false;
  }
}

Map<String, dynamic> toJson() {
  return teacherDetails;
}
