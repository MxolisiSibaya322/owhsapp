import 'package:flutter/material.dart';
import 'package:owhsapp/Authentication/ValidateLogin.dart';

import '../../Authentication/ValidateSignUp.dart';
import '../../LoadingScreen.dart';
import 'AddLearner.dart';

class ListAllStudents extends StatefulWidget {
  const ListAllStudents({super.key});

  @override
  State<ListAllStudents> createState() => _ListAllStudentsState();
}

class _ListAllStudentsState extends State<ListAllStudents> {
  allStudentsGet() async {
    await getAllStudents();
    await get12A();
    await get12B();
    _showClass = true;
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
    "ALL STUDENTS"
  ];
  String? _position;
  Future<Map<String, dynamic>> grade(String? grade) async =>
      await getStudents(grade!);
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

  List<DataRow> _buildRows(Map<String, dynamic> studentsToShow) {
    List<DataRow> rows = [];
    List<DataCell> cells = [];

    // Map<String, dynamic> gradeClass = await grade(_position);

    for (var student in studentsToShow.entries) {
      cells = [];
      if (student.key != "ClassTeacher") {
        cells.add(DataCell(Text(student.key)));
        cells.add(DataCell(Text(student.value["GRADE"] ?? "N/A")));
        cells.add(DataCell(Text(student.value["ID-NUMBER"].toString())));
        cells.add(DataCell(Text(
            "${student.value["GUARDIAN"]["NAME"]} ${student.value["GUARDIAN"]["SURNAME"]}")));
        cells.add(
            DataCell(Text(student.value["GUARDIAN"]["CELL-NUMBER"] ?? "N/A")));
        rows.add(DataRow(cells: cells));
      }
    }

    return rows;
  }

  Widget? getTable() {
    return DataTable(columns: _buildCols(), rows: _buildRows(allStudents));
  }

  getClass(Map<String, dynamic> className) {
    return DataTable(columns: _buildCols(), rows: _buildRows(className));
  }

  Widget? displayClass() {
    Widget? widget = loading(context);
    setState(() {
      _showClass = true;
      if (_position == "GRADE 12A") {
        widget = SingleChildScrollView(
            scrollDirection: Axis.horizontal, child: getClass(grade12a));
      }
      if (_position == "GRADE 12B") {
        widget = SingleChildScrollView(
            scrollDirection: Axis.horizontal, child: getClass(grade12b));
      } else {
        widget = SingleChildScrollView(
            scrollDirection: Axis.horizontal, child: getTable());
      }
    });

    return widget;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(""),
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
                      child: const Text("Add Learner")),
                ),
                const SizedBox(height: 16.0),
              ],
            ),
          )),
    );
  }
}
