import 'package:flutter/material.dart';
import 'package:live_score_app_with_firebase/home_screen.dart';
import 'package:live_score_app_with_firebase/sign_up_screen.dart';

class FootballLiveScoreApp extends StatelessWidget {
  const FootballLiveScoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SignUpScreen(),
    );
  }
}
