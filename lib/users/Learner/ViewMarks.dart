import 'package:flutter/material.dart';
import 'package:owhsapp/Authentication/ValidateLogin.dart';

class ViewMarks extends StatefulWidget {
  const ViewMarks({super.key});

  @override
  State<ViewMarks> createState() => _ViewMarksState();
}

List<DataColumn> _buildColumns() {
  return [
    const DataColumn(label: Text('Subjects')),
    const DataColumn(label: Text('TERM 1')),
    const DataColumn(label: Text('TERM 2')),
    const DataColumn(label: Text('TERM 3')),
    const DataColumn(label: Text('TERM 4')),
  ];
}

List<dynamic> subjects = loggedInUserDetails["SUBJECTS"];
List<List<int>> marks = [];

getMarks() {
  marks = [];
  List<List<int>> tempMarks = [];
  Map<String, dynamic> allMarks = loggedInUserDetails["MARKS"];

  for (var subject in allMarks.values) {
    List<dynamic> termD = subject;
    tempMarks.add([
      termD.elementAt(0) as int,
      termD.elementAt(1) as int,
      termD.elementAt(2) as int,
      termD.elementAt(3) as int,
    ]);
  }

  for (int j = 0; j < 4; j++) {
    List<int> term = [];
    for (int i = 0; i < tempMarks.length; i++) {
      term.add(tempMarks[i][j]);
    }
    marks.add(term);
  }
  print(marks.length);
}

List<DataRow> _handleRows() {
  // List<DataCell> cells = [];

  List<DataRow> rows = [];
  getMarks();
  for (int i = 0; i < subjects.length; i++) {
    List<DataCell> cells = [];

    cells.add(DataCell(Text(subjects[i])));

    for (int j = 0; j < marks.length; j++) {
      cells.add(DataCell(Text(
        "${marks[j][i]}",
        textAlign: TextAlign.center,
      )));
    }

    rows.add(DataRow(cells: cells));
  }

  return rows;
}

double termAverage() {
  return 50.0;
}

class _ViewMarksState extends State<ViewMarks> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        persistentFooterButtons: const [
          SingleChildScrollView(
            child: Row(
              children: [
                Icon(Icons.house_outlined),
                Text("7339 VILAKAZI STREET,\n orlando west, SOWETO,1804")
              ],
            ),
          ),
          Row(
            children: [
              Icon(Icons.email_outlined),
              Text("orlandowesthigh@gmail.com")
            ],
          ),
          Row(
            children: [Icon(Icons.phone_android_outlined), Text("082-5574212")],
          ),
        ],
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 50.0),
                const Text("PROGRESS REPORT FOR :"),
                Text(
                  "${loggedInUserDetails["NAME"]} ${loggedInUserDetails["SURNAME"]}",
                  style: const TextStyle(fontWeight: FontWeight.bold),
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
                    width: 50,
                    height: 50,
                  ),
                ),
                const SizedBox(height: 50.0),
                Row(
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        CircularProgressIndicator(
                          strokeWidth: 10.0,
                          value: termAverage() / 100,
                        ),
                        Text("${termAverage()}")
                      ],
                    ),
                    const SizedBox(width: 16.0),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        CircularProgressIndicator(
                          strokeWidth: 10.0,
                          value: termAverage() / 100,
                        ),
                        Text("${termAverage()}")
                      ],
                    ),
                    const SizedBox(width: 16.0),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        CircularProgressIndicator(
                          strokeWidth: 10.0,
                          value: termAverage() / 100,
                        ),
                        Text("${termAverage()}")
                      ],
                    ),
                    const SizedBox(width: 16.0),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        CircularProgressIndicator(
                          strokeWidth: 10.0,
                          value: termAverage() / 100,
                        ),
                        Text("${termAverage()}")
                      ],
                    ),
                    const SizedBox(width: 16.0),
                  ],
                ),
                const SizedBox(height: 30.0),
                Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/background.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Container(
                        color: Colors.white,
                        child: DataTable(
                            columns: _buildColumns(), rows: _handleRows())),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
