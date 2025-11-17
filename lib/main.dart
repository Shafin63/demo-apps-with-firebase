import 'package:flutter/material.dart';
import 'package:live_score_app_with_firebase/app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:live_score_app_with_firebase/fcm_service.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  FCMService.initialize();
  runApp(const FootballLiveScoreApp());
}
