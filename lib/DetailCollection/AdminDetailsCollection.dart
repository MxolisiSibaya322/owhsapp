import 'package:flutter/material.dart';
import 'package:owhsapp/Authentication/ValidateSignUp.dart';

final TextEditingController names = TextEditingController();
final TextEditingController surname = TextEditingController();
final TextEditingController password = TextEditingController();
final TextEditingController idNumber = TextEditingController();
final TextEditingController repeatpassword = TextEditingController();
final TextEditingController email = TextEditingController();
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

validateAdminDetails(BuildContext context) async {
  admins = await getAdmins("admins");
  name = names.text.trim().toUpperCase();
  surnames = surname.text.trim().toUpperCase();
  passwords = password.text.trim().toUpperCase();
  repeatPasswords = password.text.trim().toUpperCase();
  emails = email.text.trim().toUpperCase();
  idNum = idNumber.text.trim().toUpperCase();

  for (var admin in admins.values) {
    if (admin["ID-NUMBER"].toString() == idNum) {
      for (var entry in admins.entries) {
        if (entry.value == admin["ID-NUMBER"]) {
          typeOfAdmin = entry.key;
        }
      }
      adminDetails = admin;
    }
  }
}

bool isValidAdmin(BuildContext context) {
  if (adminDetails.isEmpty) {
    errorMessage(context,
        "ID Number: $idNum does not match any of the registered admins in Orlando West High");
    return false;
  }

  if (adminDetails["NAME"].trim() != name) {
    errorMessage(context,
        "the name(s) :$names do not match that of the admin with ID number $idNumber");
    return false;
  }
  if (admins["SURNAME"].trim() != surnames) {
    errorMessage(context,
        "the surname :$surname do not match that of the learner with ID number $idNumber");
    return false;
  }

  return true;
}
