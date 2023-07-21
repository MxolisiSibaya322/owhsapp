// ignore_for_file: prefer_adjacent_string_concatenation

import 'package:flutter/material.dart';

import '../../DetailCollection/learnerDetailsCollection.dart';

class AddLearner extends StatefulWidget {
  const AddLearner({super.key});

  @override
  State<AddLearner> createState() => _AddLearnerState();
}

class _AddLearnerState extends State<AddLearner> {
  bool showSubject = false;
  bool isValidName = true;
  bool isValidSurname = true;
  bool isValidID = true;
  validateID(String id) {
    setState(() {
      isValidID = int.tryParse(id.trim()) != null;
    });
  }

  @override
  initState() {
    super.initState();
  }

  showSubjects() {
    return Column(
      children: [
        const Center(child: Text("Learner's subjects :")),
        const SizedBox(height: 16.0),
        TextField(
          controller: subject1Controller,
          decoration: const InputDecoration(
            labelText: 'SUBJECT 1',
          ),
        ),
        const SizedBox(height: 16.0),
        TextField(
          controller: subject2Controller,
          decoration: const InputDecoration(
            labelText: 'SUBJECT 2',
          ),
        ),
        const SizedBox(height: 16.0),
        TextField(
          controller: subject3Controller,
          decoration: const InputDecoration(
            labelText: 'SUBJECT 3',
          ),
        ),
        const SizedBox(height: 16.0),
        TextField(
          controller: subject4Controller,
          decoration: const InputDecoration(
            labelText: 'SUBJECT 4',
          ),
        ),
        const SizedBox(height: 16.0),
        TextField(
          controller: subject5Controller,
          decoration: const InputDecoration(
            labelText: 'SUBJECT 5',
          ),
        ),
        const SizedBox(height: 16.0),
        TextField(
          controller: subject6Controller,
          decoration: const InputDecoration(
            labelText: 'SUBJECT 6',
          ),
        ),
        const SizedBox(height: 16.0),
        TextField(
          controller: subject7Controller,
          decoration: const InputDecoration(
            labelText: 'SUBJECT 7',
          ),
        ),
        const SizedBox(height: 16.0),
      ],
    );
  }

  validateName(String value) {
    setState(() {
      isValidName = RegExp(r'^[a-zA-Z\s]*$').hasMatch(value.trim());
    });
  }
  // validateEmail(String value) {
  //   setState(() {
  //     isValidName = RegExp(r'^[a-zA-Z]+$').hasMatch(value);
  //   });
  // }

  validateSurname(String value) {
    setState(() {
      isValidSurname = RegExp(r'^[a-zA-Z\s]*$').hasMatch(value.trim());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('ADD NEW LEARNER')),
      ),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color:
                          Colors.yellow, // Set the color of the border outline
                      width: 2.0, // Set the width of the border outline
                    ),
                  ),
                  child: Image.asset(
                    "assets/images/badge.png",
                    width: 100,
                    height: 100,
                  ),
                ),
                const Text(
                  "Learner details : ",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.4,
                      fontStyle: FontStyle.italic),
                ),
                TextField(
                  controller: namess,
                  onChanged: validateName,
                  textCapitalization: TextCapitalization.characters,
                  decoration: InputDecoration(
                    labelText: 'Names (as they appear on ID)',
                    errorText: isValidName
                        ? null
                        : 'Name cannot have digits..unless you are Elon Musks child?',
                  ),
                ),
                const SizedBox(height: 16.0),
                TextField(
                  controller: surnames,
                  onChanged: validateSurname,
                  textCapitalization: TextCapitalization.characters,
                  decoration: InputDecoration(
                    labelText: 'Surname',
                    errorText:
                        isValidSurname ? null : 'Surname cannot have digits',
                  ),
                ),
                const SizedBox(height: 16.0),
                DropdownButtonFormField<String>(
                  value: grade,
                  items: dropdownOptions.map((String option) {
                    return DropdownMenuItem<String>(
                      value: option,
                      child: Text(option),
                    );
                  }).toList(),
                  onChanged: (String? value) {
                    setState(() {
                      grade = value;
                    });
                  },
                  decoration: const InputDecoration(
                    labelText: 'Select The Learner\'s Class',
                    // Add additional styling or decoration as needed
                  ),
                ),
                const SizedBox(height: 16.0),
                DropdownButtonFormField<String>(
                  value: streamChosen,
                  items: streamOptions.map((String option) {
                    return DropdownMenuItem<String>(
                      value: option,
                      child: Text(option),
                    );
                  }).toList(),
                  onChanged: (String? value) {
                    setState(() {
                      streamChosen = value;
                    });
                  },
                  decoration: const InputDecoration(
                    labelText: 'Select The Learner\'s Stream',
                    // Add additional styling or decoration as needed
                  ),
                ),
                const SizedBox(height: 16.0),
                DropdownButtonFormField<String>(
                  value: homeLang,
                  items: homeLanuage.map((String option) {
                    return DropdownMenuItem<String>(
                      value: option,
                      child: Text(option),
                    );
                  }).toList(),
                  onChanged: (String? value) {
                    setState(() {
                      homeLang = value;
                      reDrawDefaults();
                      showSubject = true;
                    });
                  },
                  decoration: const InputDecoration(
                    labelText: 'Select The Learner\'s Home Language',
                    // Add additional styling or decoration as needed
                  ),
                ),
                const SizedBox(height: 16.0),
                TextField(
                  controller: idNumberController,
                  onChanged: validateID,
                  decoration: InputDecoration(
                    labelText: 'ID Number',
                    errorText:
                        isValidID ? null : 'ID number can only contain digits',
                  ),
                ),
                const SizedBox(height: 16.0),
                const Center(
                  child: Text(
                    "Guardian details : ",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.4,
                        fontStyle: FontStyle.italic),
                  ),
                ),
                const SizedBox(height: 16.0),
                TextField(
                  controller: gnamesController,
                  decoration: const InputDecoration(
                    labelText: 'Names (as they appear on ID)',
                  ),
                ),
                const SizedBox(height: 16.0),
                TextField(
                  controller: gsurnameController,
                  decoration: const InputDecoration(
                    labelText: 'Surname',
                  ),
                ),
                const SizedBox(height: 16.0),
                TextField(
                  controller: phoneNumberController,
                  onChanged: validateID,
                  // controller: gnamesController,
                  decoration: InputDecoration(
                    labelText: 'Cell number',
                    errorText: isValidID
                        ? null
                        : 'Cell number can only contain digits',
                  ),
                ),
                const SizedBox(height: 16.0),
                showSubject ? showSubjects() : const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () async {
                    createLearner();
                    String text =
                        "You are about to add a learner with the following details:\n\nFull Name : $names $surname \nID Number : $idNumber " +
                            "\nGRADE :  $grade\nGuardian : $gnames $gsurname\nCELL NUMBER : $phoneNumber\n SUBJECTS : ${subjects.toString()}\n\n Are these details correct?";
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            content: Text(
                              text,
                              style: const TextStyle(color: Colors.black),
                            ),
                            actions: [
                              ElevatedButton(
                                  onPressed: () async {
                                    await confirmSubjects(context);

                                    Navigator.of(context).pop();
                                  },
                                  child: const Text("Yes")),
                              ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text("No"))
                            ],
                          );
                        });
                  },
                  child: const Text('Confirm addition of learner'),
                ),
                const SizedBox(height: 16.0),
              ],
            ),
          )),
    );
  }
}
