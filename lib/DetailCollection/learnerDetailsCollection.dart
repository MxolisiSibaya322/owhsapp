// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:owhsapp/Authentication/ValidateSignUp.dart';
import 'package:random_string/random_string.dart';

import '../MailSender.dart';
// import 'package:owhsapp/SignUpTypes/SignUpPage.dart';

final TextEditingController namess = TextEditingController();
final TextEditingController surnames = TextEditingController();
final TextEditingController idNumberController = TextEditingController();
final TextEditingController emailController = TextEditingController();
final TextEditingController gnamesController = TextEditingController();
final TextEditingController gsurnameController = TextEditingController();
final TextEditingController passwordController = TextEditingController();
final TextEditingController repeatpasswordController = TextEditingController();

Map<String, dynamic> studentDatabase = {};
Map<String, dynamic> userDetails = {};
Map<String, dynamic> guardianDetails = {};
List<String> dropdownOptions = ['GRADE 12A', 'GRADE 12B'];
String? grade;
String codeGenerated = randomAlphaNumeric(7);
String names = "";
String surname = "";
String email = "";
String idNumber = "";
String gnames = "";
String gsurname = "";
String password = "";
String repeatPassword = "";
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

Future<bool> isValidA(BuildContext context) async {
  names = namess.text.trim().toUpperCase();
  surname = surnames.text.trim().toUpperCase();
  email = emailController.text.trim().toLowerCase();
  idNumber = idNumberController.text.trim();
  studentDatabase = await getStudents(grade!);

  for (var student in studentDatabase.values) {
    if (student["ID-NUMBER"].toString() == idNumber) {
      userDetails = student;
      userDetails["DocName"] = student["NAME"] + " " + student["SURNAME"];
      userDetails["PASSWORD"] = password;
      userDetails["EMAIL"] = email;
      break;
    }
  }
  if (userDetails.isEmpty) {
    errorMessage(context,
        "ID Number $idNumber does not match any of the registered students in $grade");
    userDetails = {};
    studentDatabase = {};
    return false;
  }

  if (userDetails["NAME"].trim() != names) {
    errorMessage(context,
        "the name(s) :$names do not match that of the learner with ID number $idNumber");
    userDetails = {};
    studentDatabase = {};
    return false;
  }
  if (userDetails["SURNAME"].trim() != surname) {
    // wrong SURNAME
    errorMessage(context,
        "the surname :$surname does not match that of the learner with ID number $idNumber");
    userDetails = {};
    studentDatabase = {};
    return false;
  }
  return true;
}

bool isValidB(BuildContext context) {
  gnames = gnamesController.text.trim().toUpperCase();
  gsurname = gsurnameController.text.trim().toUpperCase();
  password = passwordController.text;
  repeatPassword = repeatpasswordController.text.trim().toUpperCase();

  guardianDetails = userDetails["GUARDIAN"];

  if (guardianDetails['NAME'] != gnames ||
      guardianDetails["SURNAME"] != gsurname) {
    errorMessage(
        context, "$gnames $gsurname is not registered as your guardian.");
    return false;
  }
  userDetails["EMAIL"] = email;
  userDetails["PASSWORD"] = password;
  userDetails["GRADE"] = grade;

  sendVerificationCode(email, codeGenerated);
  if (errMessageMailSender == "") {
    return true;
  } else {
    errorMessage(context, errMessageMailSender);
    return false;
  }
}

Map<String, dynamic> toJson() {
  return userDetails;
}
