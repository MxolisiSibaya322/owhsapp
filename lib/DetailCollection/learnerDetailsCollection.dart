// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:owhsapp/Authentication/ValidateSignUp.dart';
import 'package:random_string/random_string.dart';

import '../LoadingScreen.dart';
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
final TextEditingController phoneNumberController = TextEditingController();

TextEditingController subject1Controller = TextEditingController();
TextEditingController subject2Controller = TextEditingController();
TextEditingController subject3Controller = TextEditingController();
TextEditingController subject4Controller = TextEditingController();
TextEditingController subject5Controller = TextEditingController();
TextEditingController subject6Controller = TextEditingController();
TextEditingController subject7Controller = TextEditingController();
reDrawDefaults() {
  subject1Controller.clear();
  subject2Controller.clear();
  subject3Controller.clear();
  subject4Controller.clear();
  subject5Controller.clear();
  subject6Controller.clear();
  subject7Controller.clear();
  assignSubjects();
  subject1Controller = TextEditingController(text: subjects[0]);
  subject2Controller = TextEditingController(text: subjects[1]);
  subject3Controller = TextEditingController(text: subjects[2]);
  subject4Controller = TextEditingController(text: subjects[3]);
  subject5Controller = TextEditingController(text: subjects[4]);
  subject6Controller = TextEditingController(text: subjects[5]);
  subject7Controller = TextEditingController(text: subjects[6]);
}

Map<String, dynamic> studentDatabase = {};
Map<String, dynamic> userDetails = {};
Map<String, dynamic> guardianDetails = {};
List<String> subjects = [];
List<String> dropdownOptions = ['GRADE 12A', 'GRADE 12B'];
List<String> streamOptions = [
  'SCIENCE',
  'GENERAL SCIENCE',
  'GENERAL',
  'ACCOUNTING'
];
List<String> homeLanuage = [
  'ISIZULU',
  'SESOTHO',
  'XHOSA',
];

String subject1 = "";
String subject2 = "";
String subject3 = "";
String subject4 = "";
String subject5 = "";
String subject6 = "";
String subject7 = "";

String? homeLang;
String? streamChosen;
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
String phoneNumber = "";

assignSubjects() {
  if (streamChosen!.contains("GENERAL SCIENCE")) {
    subjects = [
      homeLang!,
      "MATHEMATICS LITERACY",
      "GEOGRAPHY",
      "LIFE SCIENCE",
      "LIFE ORIENTATION",
      "HISTORY",
      "ENGLISH FAL"
    ];
    return;
  }
  if (streamChosen!.contains("SCIENCE")) {
    subjects = [
      homeLang!,
      "MATHEMATICS",
      "GEOGRAPHY",
      "LIFE SCIENCE",
      "LIFE ORIENTATION",
      "PHYSICAL SCIENCE",
      "ENGLISH FAL"
    ];
    return;
  }

  if (streamChosen!.contains("GENERAL")) {
    subjects = [
      homeLang!,
      "MATHEMATICS LITERACY",
      "TOURISM",
      "BUSINESS STUDIES",
      "LIFE ORIENTATION",
      "HISTORY",
      "ENGLISH FAL"
    ];
    return;
  }
  if (streamChosen!.contains("ACCOUNTING")) {
    subjects = [
      homeLang!,
      "MATHEMATICS",
      "BUSINESS STUDIES",
      "ACCOUNTING",
      "LIFE ORIENTATION",
      "ECONOMICS",
      "ENGLISH FAL"
    ];
  }
}

createLearner() {
  names = namess.text.trim().toUpperCase();
  surname = surnames.text.trim().toUpperCase();
  idNumber = idNumberController.text.trim();
  gnames = gnamesController.text.trim().toUpperCase();
  gsurname = gsurnameController.text.trim().toUpperCase();
  phoneNumber = phoneNumberController.text.trim();
  subject1 = subject1Controller.text.trim().toUpperCase();
  subject2 = subject2Controller.text.trim().toUpperCase();
  subject3 = subject3Controller.text.trim().toUpperCase();
  subject4 = subject4Controller.text.trim().toUpperCase();
  subject5 = subject5Controller.text.trim().toUpperCase();
  subject6 = subject6Controller.text.trim().toUpperCase();
  subject7 = subject7Controller.text.trim().toUpperCase();
  subjects = [
    subject1,
    subject2,
    subject3,
    subject4,
    subject5,
    subject6,
    subject7
  ];
}

Future<void> confirmSubjects(BuildContext context) async {
  subject1 = subject1Controller.text.trim().toUpperCase();
  subject2 = subject2Controller.text.trim().toUpperCase();
  subject3 = subject3Controller.text.trim().toUpperCase();
  subject4 = subject4Controller.text.trim().toUpperCase();
  subject5 = subject5Controller.text.trim().toUpperCase();
  subject6 = subject6Controller.text.trim().toUpperCase();
  subject7 = subject7Controller.text.trim().toUpperCase();
  subjects = [
    subject1,
    subject2,
    subject3,
    subject4,
    subject5,
    subject6,
    subject7
  ];
  Map<String, dynamic> marks = {};
  for (int i = 0; i < subjects.length; i++) {
    marks[subjects[i]] = [0, 0, 0, 0];
  }

  await addLearner({
    "NAME": names,
    "SURNAME": surname,
    "GRADE": grade,
    "ID-NUMBER": idNumber,
    "GUARDIAN": {
      "NAME": gnames,
      "SURNAME": gsurname,
      "CELL-NUMBER": phoneNumber
    },
    "SUBJECT": subjects,
    "MARKS": marks
  });

  String _text = "A new learner : $names $surname has been added to $grade ";
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text(
            _text,
            style: const TextStyle(color: Colors.green),
          ),
          actions: [
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("OK"))
          ],
        );
      });
}

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
  userDetails = {};
  names = namess.text.trim().toUpperCase();
  surname = surnames.text.trim().toUpperCase();
  email = emailController.text.trim().toLowerCase();
  idNumber = idNumberController.text.trim();
  studentDatabase = await getStudents(grade!);

  for (var student in studentDatabase.values) {
    if (student["ID-NUMBER"].toString() == idNumber) {
      userDetails = student;
      userDetails["DocName"] = student["NAME"] + " " + student["SURNAME"];

      break;
    }
  }

  Navigator.of(context).pop();

  print(userDetails);
  if (userDetails["EMAIL"] != null) {
    errorMessage(context, "${userDetails["NAME"]} is already registered");
    return false;
  }
  if (userDetails.isEmpty) {
    errorMessage(context,
        "ID Number $idNumber does not match any of the registered students in $grade");
    userDetails = {};
    studentDatabase = {};
    return false;
  }
  userDetails["PASSWORD"] = password;
  userDetails["EMAIL"] = email;
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
  password = passwordController.text.trim();
  repeatPassword = repeatpasswordController.text.trim();

  guardianDetails = userDetails["GUARDIAN"];
  Navigator.of(context).pop();
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
