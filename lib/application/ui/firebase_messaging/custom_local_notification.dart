// ignore_for_file: sort_constructors_first

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class CustomLocalNotification {
  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  late AndroidNotificationChannel channel;

  CustomLocalNotification() {
    channel = const AndroidNotificationChannel(
      'high_importance_channel',
      'High Importance Notifications',
      description: 'This channel is used for important notifications',
      importance: Importance.max,
    );

    _configureAndroid().then(
      (value) {
        flutterLocalNotificationsPlugin = value;
        inicializeNotifications();
      },
    );
  }

  Future<FlutterLocalNotificationsPlugin> _configureAndroid() async {
    final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    return flutterLocalNotificationsPlugin;
  }

  Future<void> inicializeNotifications() async {
    const android = AndroidInitializationSettings('@mipmap/ic_launcher');
    await flutterLocalNotificationsPlugin.initialize(
      const InitializationSettings(android: android),
    );
  }

  Future<void> androidNotification(
      RemoteNotification notification, AndroidNotification android) async {
    await flutterLocalNotificationsPlugin.show(
      notification.hashCode,
      notification.title,
      notification.body,
      NotificationDetails(
        android: AndroidNotificationDetails(
          channel.id,
          channel.name,
          channelDescription: channel.description,
          icon: android.smallIcon,
        ),
      ),
    );
  }
}