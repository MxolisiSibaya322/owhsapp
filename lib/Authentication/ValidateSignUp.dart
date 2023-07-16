import 'package:cloud_firestore/cloud_firestore.dart';

final _db = FirebaseFirestore.instance;
Map<String, dynamic> allStudents = {};
Map<String, dynamic> students = {};
Map<String, dynamic> admins = {};
Map<String, dynamic> teachers = {};

Future<void> updateStudent(
    Map<String, dynamic> updated, String classname, String docName) async {
  await _db
      .collection("learners")
      .doc("Grade 12")
      .collection(classname.toUpperCase())
      .doc(docName.toUpperCase())
      .update(updated);
}

Future<void> updateAdmin(Map<String, dynamic> updated, String docName) async {
  await _db.collection("admins").doc(docName).update(updated);
}

Future<void> updateTeacher(Map<String, dynamic> updated, String docName) async {
  await _db.collection("teachers").doc(docName).update(updated);
}

updateUser(Map<String, dynamic> updated, String? type) {
  if (type == "learner") {
    updateStudent(updated, updated["GRADE"]!,
        updated["NAME"]! + " " + updated["SURNAME"]!);
  }
  if (type == "admin") {
    updateAdmin(updated, updated["DocName"]!);
  }
  if (type == "teacher") {
    updateTeacher(updated, updated["DocName"]);
  }
}

Future<Map<String, dynamic>> getStudents(String classname) async {
  await _db
      .collection("learners")
      .doc("Grade 12")
      .collection(classname.toUpperCase())
      .get()
      .then(
    (querySnapshot) {
      for (var docSnapshot in querySnapshot.docs) {
        students[docSnapshot.id] = docSnapshot.data();
      }
    },
    onError: (e) => students,
  );

  return students;
}

Future<Map<String, dynamic>> getAllStudents() async {
  await _db.collection("learners").doc("Grade 12").get().then(
    (classes) {
      allStudents[classes.id] = classes.data();
    },
    onError: (e) => allStudents,
  );

  return allStudents;
}

Future<Map<String, dynamic>> getAdmins(String position) async {
  await _db.collection("admins").get().then(
    (querySnapshot) {
      for (var docSnapshot in querySnapshot.docs) {
        admins[docSnapshot.id] = docSnapshot.data();
      }
    },
    onError: (e) => admins,
  );

  return admins;
}

Future<Map<String, dynamic>> getTeachers() async {
  await _db.collection("teachers").get().then(
    (querySnapshot) {
      for (var docSnapshot in querySnapshot.docs) {
        teachers[docSnapshot.id] = docSnapshot.data();
      }
    },
    onError: (e) => teachers,
  );

  return teachers;
}
