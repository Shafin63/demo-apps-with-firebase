import 'package:firebase_messaging/firebase_messaging.dart';

class FCMService {
  static Future<void> initialize() async {
    FirebaseMessaging.instance.requestPermission();

    //Foreground state
    FirebaseMessaging.onMessage.listen(_handleNotification);

    // Background state
    FirebaseMessaging.onMessageOpenedApp.listen(_handleNotification);
    
    //Terminated state
    FirebaseMessaging.onBackgroundMessage(_handleTerminatedAppNotification);
  }

  static void _handleNotification(RemoteMessage message) {
    print(message.data);
    print(message.notification?.title);
    print(message.notification?.body);
  }
}

Future<void> _handleTerminatedAppNotification(RemoteMessage message) async {

}