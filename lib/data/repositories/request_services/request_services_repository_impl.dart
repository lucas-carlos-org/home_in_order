import 'dart:developer';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:home_in_order/application/exceptions/failure.dart';
import 'package:home_in_order/data/repositories/request_services/request_services_repository.dart';
import 'package:home_in_order/domain/models/file_model.dart';
import 'package:home_in_order/domain/models/request_service_model.dart';

class RequestServicesRepositoryImpl implements IRequestServicesRepository {
  @override
  Future<void> sendRequestService(String curretUserId, String userId,
      RequestServiceModel requestServiceModel) async {
    try {
      var collectionRef = FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .collection('pending_services')
          .doc();

      final requestServiceFinal = RequestServiceModel(
          contractorId: curretUserId,
          providerId: userId,
          id: requestServiceModel.id,
          imageAvatar: requestServiceModel.imageAvatar,
          name: requestServiceModel.name,
          deviceToken: requestServiceModel.deviceToken,
          description: requestServiceModel.description,
          address: requestServiceModel.address,
          city: requestServiceModel.city,
          createAt: requestServiceModel.createAt,
          number: requestServiceModel.number,
          status: null,
          files:
              await uploadServiceListImages(userId, requestServiceModel.files));

      final requestServiceModelData = requestServiceFinal;
      Map<String, dynamic> requestServiceModelToMap =
          requestServiceModelData.toMap();
      await collectionRef.set(requestServiceModelToMap);
    } catch (e) {
      throw Failure(message: 'Error ao salvar dados do usuario!');
    }
  }

  @override
  Future<List<FileModel>> uploadServiceListImages(
      String userId, List<FileModel> files) async {
    final date = DateTime.now();
    final storageRef = FirebaseStorage.instance.ref();
    var downloadUrls = <FileModel>[];

    for (var i = 0; i < files.length; i++) {
      final refFeedBucket =
          storageRef.child(userId).child('service_photo$date[$i].png');
      final file = File(files[i].imagePath);
      await refFeedBucket.putFile(file);

      var urls = await refFeedBucket.getDownloadURL();
      downloadUrls.add(FileModel(imagePath: urls));
    }

    return downloadUrls.toList();
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
      downloadUrls.add(FileModel(imagePath: urls));
    }

    for (var i = 0; i < downloadUrls.length; i++) {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .collection('job_images')
          .add(
            ({'get_image_job': downloadUrls[i].imagePath}),
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
}
