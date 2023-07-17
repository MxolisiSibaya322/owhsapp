// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:owhsapp/Authentication/ValidateSignUp.dart';
import 'package:random_string/random_string.dart';
import '../MailSender.dart';

final TextEditingController names = TextEditingController();
final TextEditingController surname = TextEditingController();
final TextEditingController password = TextEditingController();
final TextEditingController idNumber = TextEditingController();
final TextEditingController repeatpassword = TextEditingController();
final TextEditingController email = TextEditingController();
List<String> dropdownOptions = ['Admin_Staff', 'principal'];
String? position;
Map<String, dynamic> admins = {};
Map<String, dynamic> adminDetails = {};

String name = "";
String surnames = "";
String passwords = "";
String repeatPasswords = "";
String idNum = "";
String emails = "";
String typeOfAdmin = "";
bool isLoading = false;
String codeGenerated = randomAlphaNumeric(7);

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

Future<bool> isValidAdmin(BuildContext context) async {
  admins = await getAdmins();
  name = names.text.trim().toUpperCase();
  surnames = surname.text.trim().toUpperCase();
  passwords = password.text;
  repeatPasswords = password.text;
  emails = email.text.trim();
  idNum = idNumber.text.trim().toUpperCase();

  for (var admin in admins.values) {
    if (admin["ID-NUMBER"].toString() == idNum) {
      for (var entry in admins.entries) {
        if (entry.value["ID-NUMBER"] == admin["ID-NUMBER"]) {
          typeOfAdmin = entry.key;
          break;
        }
      }
      adminDetails = admin;
      adminDetails["DocName"] = typeOfAdmin;
      adminDetails["PASSWORD"] = passwords;
      adminDetails["EMAIL"] = emails;
      break;
    }
  }
  if (adminDetails["EMAIL"] != null) {
    errorMessage(context, "${adminDetails["NAME"]} is already registered");
    return false;
  }
  if (adminDetails.isEmpty) {
    errorMessage(context,
        "ID Number: $idNum does not match any of the registered admins in Orlando West High");
    return false;
  }

  if (adminDetails["NAME"] != name) {
    errorMessage(context,
        "the name(s) :$name do not match that of the admin with ID number $idNum");
    return false;
  }
  if (adminDetails["SURNAME"].trim() != surnames) {
    errorMessage(context,
        "the surname :$surnames do not match that of the learner with ID number $idNum");
    return false;
  }

  await sendVerificationCode(emails, codeGenerated);
  if (errMessageMailSender == "") {
    return true;
  } else {
    errorMessage(context, errMessageMailSender);
    return false;
  }
}

Map<String, dynamic> toJson() {
  return adminDetails;
}
