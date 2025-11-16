import 'package:flutter/material.dart';
import 'package:live_score_app_with_firebase/home_screen.dart';

class StudentInfoApp extends StatelessWidget {
  const StudentInfoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StudentInfoHome(),
    );
  }
}
