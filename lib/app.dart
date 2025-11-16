import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:live_score_app_with_firebase/home_screen.dart';
import 'package:live_score_app_with_firebase/sign_up_screen.dart';

import 'sign_in_screen.dart';

class FootballLiveScoreApp extends StatelessWidget {
  const FootballLiveScoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, asyncSnapshot) {
          if (asyncSnapshot.hasData) {
            return const HomeScreen();
          } else {
            return SignInScreen();
          }
        },
      ),
    );
  }
}
