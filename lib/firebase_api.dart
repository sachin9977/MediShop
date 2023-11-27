import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:medshop/main.dart';

class FirebaseApi {
  final _firebaseMessanging = FirebaseMessaging.instance;

  Future<void> initNotification() async {
    await _firebaseMessanging.requestPermission();

    final fCMToken = await _firebaseMessanging.getToken();

    print('Token: $fCMToken');

    initPushNotification();
  }

  //  Handle received message

  void handleMessage(RemoteMessage? message) {
    String txt = "No Notification Found";
    if (message == null) {
      navigatorKey.currentState?.pushNamed('/notification', arguments: txt);
    }
    navigatorKey.currentState?.pushNamed('/notification', arguments: message);
  }

  Future initPushNotification() async {
    FirebaseMessaging.instance.getInitialMessage().then(handleMessage);

    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
  }
}
