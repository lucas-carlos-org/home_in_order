import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:home_in_order/application/ui/firebase_messaging/custom_local_notification.dart';
import 'package:home_in_order/application/ui/navigator/navigator_service.dart';

class CustomFirebaseMessaging {
  final CustomLocalNotification _customLocalNotification;

  CustomFirebaseMessaging._internal(this._customLocalNotification);
  static final CustomFirebaseMessaging _singleton =
      CustomFirebaseMessaging._internal(CustomLocalNotification());
  factory CustomFirebaseMessaging() => _singleton;

  Future<void> inicialize() async {
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
            badge: true, sound: true, alert: true);

    FirebaseMessaging.onMessage.listen((message) {

      _customLocalNotification.androidNotification(
        message.data['title'],
        message.data['body'],
      );
    });

    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      if (message.data['route'] != null) {
        NavigationService.navigatorKey.currentState
            ?.pushNamed(message.data['route']);
      }
    });
  }
}
