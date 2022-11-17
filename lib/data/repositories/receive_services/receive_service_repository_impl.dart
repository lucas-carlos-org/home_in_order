import 'dart:convert';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:home_in_order/data/repositories/receive_services/receive_service_repository.dart';
import 'package:home_in_order/domain/models/provider_historic_model.dart';

class ReceiveServiceRepositoryImpl implements IReceiveServiceRepository {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  @override
  void requestPermission() async {
    NotificationSettings settings =
        await FirebaseMessaging.instance.requestPermission(
      alert: true,
      announcement: true,
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
                'key=AAAApNDo9mY:APA91bFN6lUSl4465jZlWQwhpprzSlglC-e-v1jirL9fr-RtsipYC4Ak8bDe9ebulyD5HxsYv78Sta0hCF5J_H4B_a6pwIhPYySvcP-W1VoWfFvxrsVLLVtL9p_-wtgkFwYcf58oCkib',
          },
        ),
        data: jsonEncode(
          <String, dynamic>{
            "to": token,
            "notification": {
              "title": title,
              "body": body,
            }, // remove this
            "data": {
              "channelId": "session_alert",
              "title": title,
              "body": body,
            }
          },
        ),
      );
    } catch (e) {
      log("Error push notification");
    }
  }

  @override
  Future<void> moveDocumentPendingToActive(String userId, String docId,
      String? contractorId, ProviderHistoricModel providerHistoricModel) async {
    var oldColl = _db
        .collection('users')
        .doc(userId)
        .collection('pending_services')
        .doc(docId);

    var newColl = _db
        .collection('users')
        .doc(userId)
        .collection('active_services')
        .doc(oldColl.id);

    await oldColl.get().then(
      (docSnapshot) {
        if (docSnapshot.exists) {
          log('Successfully found document');

          newColl
              .set({
                'name': docSnapshot['name'],
                'image_avatar': docSnapshot['imageAvatar'],
                'id': docSnapshot['id'],
                'files': docSnapshot['files'],
                'device_token': docSnapshot['deviceToken'],
                'description': docSnapshot['description'],
                'address': docSnapshot['address'],
                'city': docSnapshot['city'],
                'number': docSnapshot['number'],
                'contractorId': docSnapshot['contractorId'],
                'createAt': docSnapshot['createAt'],
                'providerId': docSnapshot['providerId'],
                'status': 'Ativo'
              })
              .then((value) => log("document moved to different collection"))
              .catchError((error) => log("Failed to move document: $error"))
              .then(
                (value) => ({
                  oldColl
                      .delete()
                      .then((value) =>
                          log("document removed from old collection"))
                      .catchError((error) {
                    newColl.delete();
                    log("Failed to delete document: $error");
                  })
                }),
              );
        } else {
          log('Failed to find document id');
        }
      },
    );
  }

  @override
  Future<void> moveDocumentPendingToHistoric(String userId, String docId,
      String? contractorId, ProviderHistoricModel providerHistoricModel) async {
    var oldColl = _db
        .collection('users')
        .doc(userId)
        .collection('pending_services')
        .doc(docId);

    var newColl = _db
        .collection('users')
        .doc(userId)
        .collection('historic_services')
        .doc(oldColl.id);

    var newCollContractor = _db
        .collection('users')
        .doc(contractorId)
        .collection('historic_services')
        .doc(oldColl.id);

    await oldColl.get().then(
      (docSnapshot) {
        if (docSnapshot.exists) {
          log('Successfully found document');

          newCollContractor
              .set({
                'name': docSnapshot['name'],
                'image_avatar': docSnapshot['imageAvatar'],
                'id': docSnapshot['id'],
                'files': docSnapshot['files'],
                'device_token': docSnapshot['deviceToken'],
                'description': docSnapshot['description'],
                'address': docSnapshot['address'],
                'city': docSnapshot['city'],
                'number': docSnapshot['number'],
                'contractorId': docSnapshot['contractorId'],
                'createAt': docSnapshot['createAt'],
                'providerId': docSnapshot['providerId'],
                'status': 'Cancelado',
                'providerName': providerHistoricModel.name,
                'providerImage': providerHistoricModel.imageAvatar,
              })
              .then((value) => log("document moved to different collection"))
              .catchError((error) => log("Failed to move document: $error"));

          newColl
              .set({
                'name': docSnapshot['name'],
                'image_avatar': docSnapshot['imageAvatar'],
                'id': docSnapshot['id'],
                'files': docSnapshot['files'],
                'device_token': docSnapshot['deviceToken'],
                'description': docSnapshot['description'],
                'address': docSnapshot['address'],
                'city': docSnapshot['city'],
                'number': docSnapshot['number'],
                'contractorId': docSnapshot['contractorId'],
                'createAt': docSnapshot['createAt'],
                'providerId': docSnapshot['providerId'],
                'status': 'Cancelado'
              })
              .then((value) => log("document moved to different collection"))
              .catchError((error) => log("Failed to move document: $error"))
              .then(
                (value) => ({
                  oldColl
                      .delete()
                      .then((value) =>
                          log("document removed from old collection"))
                      .catchError((error) {
                    newColl.delete();
                    log("Failed to delete document: $error");
                  })
                }),
              );
        } else {
          log('Failed to find document id');
        }
      },
    );
  }

  @override
  Future<void> moveDocumentActiveToHistoric(String userId, String docId,
      String? contractorId, ProviderHistoricModel providerHistoricModel) async {
    var oldColl = _db
        .collection('users')
        .doc(userId)
        .collection('active_services')
        .doc(docId);

    var newColl = _db
        .collection('users')
        .doc(userId)
        .collection('historic_services')
        .doc(oldColl.id);

    var newCollContractor = _db
        .collection('users')
        .doc(contractorId)
        .collection('historic_services')
        .doc(oldColl.id);

    await oldColl.get().then(
      (docSnapshot) {
        if (docSnapshot.exists) {
          log('Successfully found document');

          newCollContractor
              .set({
                'name': docSnapshot['name'],
                'image_avatar': docSnapshot['image_avatar'],
                'id': docSnapshot['id'],
                'files': docSnapshot['files'],
                'device_token': docSnapshot['device_token'],
                'description': docSnapshot['description'],
                'address': docSnapshot['address'],
                'city': docSnapshot['city'],
                'number': docSnapshot['number'],
                'contractorId': docSnapshot['contractorId'],
                'createAt': docSnapshot['createAt'],
                'providerId': docSnapshot['providerId'],
                'status': 'Ativo',
                'providerName': providerHistoricModel.name,
                'providerImage': providerHistoricModel.imageAvatar,
              })
              .then((value) => log("document moved to different collection"))
              .catchError((error) => log("Failed to move document: $error"));

          newColl
              .set({
                'name': docSnapshot['name'],
                'image_avatar': docSnapshot['image_avatar'],
                'id': docSnapshot['id'],
                'files': docSnapshot['files'],
                'device_token': docSnapshot['device_token'],
                'description': docSnapshot['description'],
                'address': docSnapshot['address'],
                'city': docSnapshot['city'],
                'number': docSnapshot['number'],
                'contractorId': docSnapshot['contractorId'],
                'createAt': docSnapshot['createAt'],
                'providerId': docSnapshot['providerId'],
                'status': 'Ativo'
              })
              .then((value) => log("document moved to different collection"))
              .catchError((error) => log("Failed to move document: $error"))
              .then(
                (value) => ({
                  oldColl
                      .delete()
                      .then((value) =>
                          log("document removed from old collection"))
                      .catchError((error) {
                    newColl.delete();
                    log("Failed to delete document: $error");
                  })
                }),
              );
        } else {
          log('Failed to find document id');
        }
      },
    );
  }
}
