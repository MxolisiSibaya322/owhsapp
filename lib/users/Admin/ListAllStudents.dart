import 'package:flutter/material.dart';
import 'package:owhsapp/Authentication/ValidateLogin.dart';

import '../../Authentication/ValidateSignUp.dart';
import '../../LoadingScreen.dart';
import 'AddLearner.dart';
import 'AdminDashboard.dart';

class ListAllStudents extends StatefulWidget {
  const ListAllStudents({super.key});

  @override
  State<ListAllStudents> createState() => _ListAllStudentsState();
}

class _ListAllStudentsState extends State<ListAllStudents> {
  List<DataRow> rows = [];
  allStudentsGet() async {
    await getAllStudents();
    // _showClass = true;
  }

  @override
  initState() {
    super.initState();
    allStudentsGet();
    _showClass = false;
  }

  final List<String> _dropdownOptions = [
    'GRADE 12A',
    'GRADE 12B',
    'GRADE 12C',
    "ALL STUDENTS"
  ];
  String? _position;
  // Future<Map<String, dynamic>> grade(String? grade) async =>
  //     await getStudents(grade!);
  late bool _showClass;
  List<DataColumn> _buildCols() {
    return [
      const DataColumn(label: Text('Full Name')),
      const DataColumn(label: Text('Grade')),
      const DataColumn(label: Text('ID Number')),
      const DataColumn(label: Text('Guardian')),
      const DataColumn(label: Text('Guardian cell number')),
    ];
  }

  moreDetail(MapEntry<String, dynamic> student) {
    String _text =
        "\n\nFull Name : ${student.key} \n\nID Number : ${student.value["ID-NUMBER"]} " +
            "\n\n${student.value["GRADE"]}\n\nGuardian : ${student.value["GUARDIAN"]["NAME"]} ${student.value["GUARDIAN"]["SURNAME"]}\n\nCELL NUMBER : ${student.value["GUARDIAN"]["CELL-NUMBER"]}\n";
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Text(
              _text,
              style: const TextStyle(color: Colors.black),
            ),
            actions: [
              ElevatedButton(
                  onPressed: () async {
                    Navigator.of(context).pop();
                  },
                  child: const Text("OK")),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text("Show Performance"))
            ],
          );
        });
  }

  List<DataRow> _buildRows(Map<String, dynamic> studentsToShow) {
    List<DataCell> cells = [];
    rows = [];
    getGrades();
    // Map<String, dynamic> gradeClass = await grade(_position);
    int count = 1;
    for (var student in studentsToShow.entries) {
      cells = [];
      if (student.key != "ClassTeacher") {
        cells.add(DataCell(Text("$count. ${student.key}"),
            onTap: () => moreDetail(student)));
        cells.add(DataCell(Text(student.value["GRADE"] ?? "N/A"),
            onTap: () => moreDetail(student)));
        cells.add(DataCell(Text(student.value["ID-NUMBER"].toString()),
            onTap: () => moreDetail(student)));
        cells.add(DataCell(
            Text(
                "${student.value["GUARDIAN"]["NAME"]} ${student.value["GUARDIAN"]["SURNAME"]}"),
            onTap: () => moreDetail(student)));
        cells.add(DataCell(
            Text(student.value["GUARDIAN"]["CELL-NUMBER"] ?? "N/A"),
            onTap: () => moreDetail(student)));
        rows.add(DataRow(cells: cells));
        count++;
      }
    }

    return rows;
  }

  Widget? getTable() {
    return DataTable(columns: _buildCols(), rows: rows);
  }

  Widget? displayClass() {
    Widget? widget = loading(context);

    _showClass = true;

    widget = SingleChildScrollView(
        scrollDirection: Axis.horizontal, child: getTable());

    return widget;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: bottomButtons(context),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 20.0,
                ),
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
                Text(
                  '${loggedInUserDetails["DocName"].toString().toUpperCase()} : ${loggedInUserDetails["SURNAME"]} ',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.4,
                      fontStyle: FontStyle.italic),
                ),
                DropdownButtonFormField<String>(
                    hint: const Text("Choose a class"),
                    value: _position,
                    items: _dropdownOptions.map((String option) {
                      return DropdownMenuItem<String>(
                        value: option,
                        child: Text(option),
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      setState(() {
                        _position = value;
                        rows = [];
                        if (_position!.contains("GRADE 12A")) {
                          rows = _buildRows(grade12a);
                        }
                        if (_position!.contains("GRADE 12B")) {
                          rows = _buildRows(grade12b);
                        }
                        if (_position!.contains("GRADE 12C")) {
                          rows = _buildRows(grade12c);
                          print(grade12c);
                        }
                        if (_position!.contains("ALL STUDENTS")) {
                          rows = _buildRows(allStudents);
                        }
                        displayClass();
                      });
                    }),
                const SizedBox(height: 16.0),
                Container(
                  child: _showClass ? displayClass() : loading(context),
                ),
                const SizedBox(height: 16.0),
                Center(
                  child: ElevatedButton(
                      onPressed: () async {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const AddLearner()));
                      },
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.person_add),
                          Text("Add Learner"),
                        ],
                      )),
                ),
                const SizedBox(height: 16.0),
              ],
            ),
          )),
    );
  }
}
