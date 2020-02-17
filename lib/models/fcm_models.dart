import 'package:firebase_messaging/firebase_messaging.dart';

class FcmModel {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  String messageText = 'Waiting for message';
  String tokinText = 'Waiting for tokin';

  FcmModel() {
    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        messageText = "FCM : $message";

        String body = message['notification']['body'];
        String title = message['notification']['title'];

        print("on message: $message");
      },
      onResume: (Map<String, dynamic> message) async {
        messageText = "FCM : $message";
        print("on resume: $message");
      },
      onLaunch: (Map<String, dynamic> message) async {
        messageText = "FCM : $message";
        print("on launch: $message");
      },
    );

    // request push notification permission
    _firebaseMessaging.requestNotificationPermissions(
      const IosNotificationSettings(sound: true, badge: true, alert: true),
    );
    _firebaseMessaging.onIosSettingsRegistered.listen(
        (IosNotificationSettings settings) =>
            print('settings registred: $settings'));

    _firebaseMessaging
        .getToken()
        .then((String token) => tokinText = "FCM tokin: $token");
  }
}
