import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:home_in_order/application/exceptions/failure.dart';
import 'package:home_in_order/domain/models/user_personal_information_model.dart';
import 'package:home_in_order/data/repositories/registration/registration_repository.dart';

class RegistrationRepositoryImpl implements IRegistrationRepository {
  @override
  Future<void> setCompleteRegistration(String userId) async {
    try {
      final userModelType =
          FirebaseFirestore.instance.collection('users').doc(userId);

      Map<String, dynamic> data = <String, dynamic>{
        "completeRegisterPhoto": true,
      };
      await userModelType.update(data);
    } catch (e) {
      throw Exception('Error');
    }
  }

  @override
  Future<void> saveUserPersonalgeInformationOnStorage(String userId,
      UserPersonalInformationModel userPersonalInformation) async {
    try {
      var collectionRef = FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .collection('userPersonalInformation');
      var collectionUser =
          FirebaseFirestore.instance.collection('users').doc(userId);

      QuerySnapshot querySnapshot = await collectionRef.get();

      if (querySnapshot.docs.isEmpty) {
        final userData = userPersonalInformation;
        Map<String, dynamic> userDataToMap = userData.toMap();

        Map<String, dynamic> data = <String, dynamic>{
          "completeRegisterData": true,
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

    final date = DateTime.now();

    Reference refFeedBucket = feedStorage.ref().child(userId).child('$date.jpeg');

    String downloadUrl;

    TaskSnapshot uploadedFile = await refFeedBucket.putFile(file);

    if (uploadedFile.state == TaskState.success) {
      downloadUrl = await refFeedBucket.getDownloadURL();
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .update({'imageAvatar': downloadUrl});
    }
  }
}
