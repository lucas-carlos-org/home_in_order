import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:home_in_order/data/repositories/request_services/request_services_repository.dart';
import 'package:home_in_order/domain/models/file_model.dart';
import 'package:home_in_order/domain/models/request_service_model.dart';

class RequestServicesRepositoryImpl implements IRequestServicesRepository {
  @override
  Future<void> sendRequestService(
      String userId, RequestServiceModel requestServiceModel) {
    // TODO: implement sendRequestService
    throw UnimplementedError();
  }

  @override
  Future<void> uploadListImages(String userId, List<File> files) async {
    final date = DateTime.now();
    final storageRef = FirebaseStorage.instance.ref();
    var downloadUrls = <FileModel>[];

    for (var i = 0; i < files.length; i++) {
      final refFeedBucket = storageRef.child(userId).child('$date[$i].png');
      await refFeedBucket.putFile(files[i]);

      var urls = await refFeedBucket.getDownloadURL();
      downloadUrls.add(FileModel(pathFile: urls));
    }

    for (var i = 0; i < downloadUrls.length; i++) {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .collection('job_images')
          .add(
            ({'get_image_job': downloadUrls[i].pathFile}),
          );
    }
  }

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
            'Authorization':
                'key=AAAApNDo9mY:APA91bGoVFL41aazXVfRSsQdG5OmVm0HETUrcIl_Rcyszk-Mk95VtAV04C0ddFPJjOLBvte87TU1c3ajP-ZnUHh5idtCxlU-B51RfmsIukY1NqP_BqYhi6O4DFZNIgGf-pr-DsQtYOaw',
          },
        ),
        data: jsonEncode(
          <String, dynamic>{
            'notification': <String, dynamic>{
              'body': body,
              'title': title,
              'payload': '/home-provider'
            },
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
