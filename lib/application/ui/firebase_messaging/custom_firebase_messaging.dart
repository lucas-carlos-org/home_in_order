/* import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:home_in_order/application/ui/firebase_messaging/custom_local_notification.dart';
import 'package:home_in_order/modules/menu/menu_provider/menu_provider_controller.dart';

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
      if (message.data['payload'] != null || message.data['payload'] != '') {
        final index = int.parse(message.data['payload'].toString());
        Get.put(MenuProviderController()).changePage(index);
      }
    });
  }
}
 */