import 'package:flutter/material.dart';
import 'package:owhsapp/Authentication/ValidateSignUp.dart';
// import 'package:owhsapp/SignUpTypes/SignUpPage.dart';

final TextEditingController namess = TextEditingController();
final TextEditingController surnames = TextEditingController();
final TextEditingController idNumberController = TextEditingController();
final TextEditingController emailController = TextEditingController();
final TextEditingController gradeController = TextEditingController();
final TextEditingController gnamesController = TextEditingController();
final TextEditingController gsurnameController = TextEditingController();
final TextEditingController passwordController = TextEditingController();
final TextEditingController repeatpasswordController = TextEditingController();

Map<String, dynamic> studentDatabase = {};
Map<String, dynamic> userDetails = {};
String codeGenerated = "OWHSAPP";
String names = "";
String surname = "";
String grade = "";
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
  grade = gradeController.text.trim().toUpperCase();
  names = namess.text.trim().toUpperCase();
  surname = surnames.text.trim().toUpperCase();
  email = emailController.text.trim().toLowerCase();
  idNumber = idNumberController.text.trim();
  studentDatabase = await getStudents(grade);

  for (var student in studentDatabase.values) {
    if (student["ID-NUMBER"].toString() == idNumber) {
      userDetails = student;
      break;
    }
  }
  if (userDetails.isEmpty) {
    errorMessage(context,
        "ID Number $idNumber does not match any of the registered students in $grade");
    return false;
  }

  if (userDetails["NAME"].trim() != names) {
    errorMessage(context,
        "the name(s) :$names do not match that of the learner with ID number $idNumber");
    return false;
  }
  if (userDetails["SURNAME"].trim() != surname) {
    // wrong SURNAME
    errorMessage(context,
        "the surname :$surname do not match that of the learner with ID number $idNumber");
    return false;
  }
  return true;
}

bool isValidB(BuildContext context) {
  gnames = gnamesController.text.trim().toUpperCase();
  gsurname = gsurnameController.text.trim().toUpperCase();
  password = passwordController.text.trim().toUpperCase();
  repeatPassword = repeatpasswordController.text.trim().toUpperCase();

  Map<String, dynamic> guardianDetails = userDetails["GUARDIAN"];

  if (guardianDetails['NAME'] != gnames ||
      guardianDetails["SURNAME"] != gsurname) {
    errorMessage(
        context, "$gnames $gsurname is not registered as your guardian.");
    return false;
  }
  return true;
}

toJson() {
  return {
    "name": names,
    "surname": surname,
    "grade": grade,
    "email": email,
    "id number": idNumber,
    "password": password,
    "gnames": gnames,
    "gsurname": gsurname
  };
}
