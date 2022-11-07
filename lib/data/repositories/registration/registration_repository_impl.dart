import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:home_in_order/application/exceptions/failure.dart';
import 'package:home_in_order/domain/models/file_model.dart';
import 'package:home_in_order/domain/models/user_contractor_information_model.dart';
import 'package:home_in_order/domain/models/user_provider_information_model.dart';
import 'package:home_in_order/data/repositories/registration/registration_repository.dart';

class RegistrationRepositoryImpl implements IRegistrationRepository {
  @override
  Future<void> setCompleteRegistration(String userId) async {
    try {
      final userModelType =
          FirebaseFirestore.instance.collection('users').doc(userId);

      Map<String, dynamic> data = <String, dynamic>{
        "complete_register_photo": true,
      };
      await userModelType.update(data);
    } catch (e) {
      throw Exception('Error');
    }
  }

  @override
  Future<void> saveProviderInformationOnStorage(String userId,
      UserProviderInformationModel userPersonalInformation) async {
    try {
      var collectionRef = FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .collection('personal_information');

      var collectionUser = FirebaseFirestore.instance.collection('users').doc(userId);

      QuerySnapshot querySnapshot = await collectionRef.get();

      if (querySnapshot.docs.isEmpty) {
        final userData = userPersonalInformation;
        Map<String, dynamic> userDataToMap = userData.toMap();

        Map<String, dynamic> data = <String, dynamic>{
          "complete_register_data": true,
        };

        await collectionUser.update(data);
        await collectionRef.doc().set(userDataToMap);
      }
    } catch (e) {
      throw Failure(message: 'Error ao salvar dados do usuario!');
    }
  }

  @override
  Future<void> saveContractorInformationOnStorage(String userId,
      UserContractorInformationModel userContractorInformationModel) async {
    try {
      var collectionRef = FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .collection('personal_information');

      var collectionUser =
          FirebaseFirestore.instance.collection('users').doc(userId);

      QuerySnapshot querySnapshot = await collectionRef.get();

      if (querySnapshot.docs.isEmpty) {
        final userData = userContractorInformationModel;
        Map<String, dynamic> userDataToMap = userData.toMap();

        Map<String, dynamic> data = <String, dynamic>{
          "complete_register_data": true,
        };

        await collectionUser.update(data);
        await collectionRef.doc().set(userDataToMap);
      }
    } catch (e) {
      throw Failure(message: 'Error ao salvar dados do usuario!');
    }
  }

  @override
  Future<void> uploadImages(String userId, File file) async {
    final FirebaseStorage feedStorage = FirebaseStorage.instanceFor();
    Reference refFeedBucket =  feedStorage.ref().child(userId).child('profile_picture.jpeg');

    String downloadUrl;

    TaskSnapshot uploadedFile = await refFeedBucket.putFile(file);

    if (uploadedFile.state == TaskState.success) {
      downloadUrl = await refFeedBucket.getDownloadURL();
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .update({'image_avatar': downloadUrl});
    }
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
}
