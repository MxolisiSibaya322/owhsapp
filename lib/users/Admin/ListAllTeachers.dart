import 'package:flutter/material.dart';

import '../../Authentication/ValidateSignUp.dart';
import '../../LoadingScreen.dart';

class ListAllTeachers extends StatefulWidget {
  const ListAllTeachers({super.key});

  @override
  State<ListAllTeachers> createState() => _ListAllTeachersState();
}

class _ListAllTeachersState extends State<ListAllTeachers> {
  allTeachersGet() async {
    await getTeachers();

    _showTeachers = true;
  }

  @override
  initState() {
    super.initState();
    allTeachersGet();
    _showTeachers = false;
  }

  // String? _position;
  Future<Map<String, dynamic>> grade(String? grade) async =>
      await getStudents(grade!);
  late bool _showTeachers;
  List<DataColumn> _buildCols() {
    return [
      const DataColumn(label: Text('Name(s)')),
      const DataColumn(label: Text('Surname')),
      const DataColumn(label: Text('ID Number')),
    ];
  }

  List<DataRow> _buildRows() {
    List<DataRow> rows = [];
    List<DataCell> cells = [];

    // Map<String, dynamic> gradeClass = await grade(_position);

    for (var teacher in teachers.entries) {
      cells = [];

      cells.add(DataCell(Text(teacher.value["NAME"])));
      cells.add(DataCell(Text(teacher.value["SURNAME"] ?? "N/A")));
      cells.add(DataCell(Text(teacher.value["ID-NUMBER"].toString())));

      rows.add(DataRow(cells: cells));
    }

    return rows;
  }

  Widget? getTable() {
    return DataTable(columns: _buildCols(), rows: _buildRows());
  }

  Widget? displayTeachers() {
    Widget? widget = loading(context);

    widget = SingleChildScrollView(
        scrollDirection: Axis.horizontal, child: getTable());

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
                // Text(
                //   '',
                //   textAlign: TextAlign.center,
                //   style: const TextStyle(
                //       fontWeight: FontWeight.bold,
                //       letterSpacing: 1.4,
                //       fontStyle: FontStyle.italic),
                // ),
                const SizedBox(height: 16.0),
                Container(
                  child: _showTeachers ? displayTeachers() : loading(context),
                ),
                const SizedBox(height: 16.0),
                Center(
                  child: Row(
                    children: [
                      ElevatedButton(
                          onPressed: () async {
                            setState(() {
                              _showTeachers = true;
                            });
                          },
                          child: const Text("View Teachers")),
                      ElevatedButton(
                          onPressed: () async {},
                          child: const Text("Add Teacher")),
                    ],
                  ),
                ),
                const SizedBox(height: 16.0),
              ],
            ),
          )),
    );
  }
}
