import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class StudentInfoHome extends StatefulWidget {
  const StudentInfoHome({super.key});

  @override
  State<StudentInfoHome> createState() => _StudentInfoHomeState();
}

class _StudentInfoHomeState extends State<StudentInfoHome> {
  List<StudentInfo> _studentsList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Students Information")),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("students").snapshots(),
        builder: (context, snapshots) {
          if (snapshots.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshots.hasError) {
            return Center(child: Text(snapshots.error.toString()));
          } else if (snapshots.hasData) {
            _studentsList.clear();
            for (QueryDocumentSnapshot<Map<String, dynamic>> doc
            in snapshots.data!.docs) {
              _studentsList.add(
                StudentInfo(
                  id: doc.id,
                  name: doc.get("name"),
                  rollNumber: doc.get("rollNumber"),
                  course: doc.get("course"),
                ),
              );
            }
            return ListView.builder(
              itemCount: _studentsList.length,
              itemBuilder: (context, index) {
                final studentInfo = _studentsList[index];
                return ListTile(
                  title: Text(studentInfo.name),
                  trailing: Text("Roll: ${studentInfo.rollNumber}"),
                  subtitle: Text("Course: ${studentInfo.course}"),
                );
              },
            );
          }
          return SizedBox();
        },
      ),
    );
  }
}

class StudentInfo {
  final String id;
  final String name;
  final int rollNumber;
  final String course;

  StudentInfo({
    required this.id,
    required this.name,
    required this.rollNumber,
    required this.course,
  });
}
