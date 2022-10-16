import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:home_in_order/data/repositories/receive_services/receive_service_repository.dart';

class ReceiveServiceRepositoryImpl implements IReceiveServiceRepository {
  @override
  void requestPermission() async {
    NotificationSettings settings =
        await FirebaseMessaging.instance.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      log('[Success] - Permissão concedida pelo usuário');
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      log('[Alert] - O usuário concedeu permissão provisória');
    } else {
      log('[Error] - O usuário recusou ou não aceitou a permissão');
    }
  }

  @override
  void sendPushMessage(String title, String body, String token) async {
    try {
      await Dio().post(
        'https://fcm.googleapis.com/fcm/send',
        options: Options(
          headers: <String, String>{
            'Content-Type': 'application/json',
            'Authorization': 'AAAApNDo9mY:APA91bFZH7hipJteI2oA5bh7J8zo2nAVy_u4cz7eKvEh-CRIFvqGFW_oFcpWEbFqvITOocWV58b3s34ek5m4H3OrVVpMiAcEeC8KyuRWdEPApkygyrFpIWuz0QRFmDLIPp2PpM0vlgi3',
          },
        ),
        data: jsonEncode(
          <String, dynamic>{
            'notification': <String, dynamic>{'body': body, 'title': title, 'payload': '/chat'},
            'priority': 'high',
            'data': <String, dynamic>{
              'click_action': 'FLUTTER_NOTIFICATION_CLICK',
              'id': '1',
              'status': 'done'
            },
            "to": token,
          },
        ),
      );
    } catch (e) {
      log("Error push notification");
    }
  }
}
