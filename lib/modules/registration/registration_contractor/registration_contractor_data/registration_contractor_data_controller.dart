import 'dart:developer';
import 'dart:io';

import 'package:get/get.dart';
import 'package:home_in_order/application/auth/auth_service.dart';
import 'package:home_in_order/domain/models/user_contractor_information_model.dart';
import 'package:home_in_order/domain/services/image_picker/image_picker_service.dart';
import 'package:home_in_order/domain/services/registration/registration_service.dart';

class RegistrationContractorDataController extends GetxController {
  RegistrationContractorDataController({
    required IRegistrationService registrationService,
    required AuthService authService,
    required IImagePickerService imagePickerService,
  })  : _registrationService = registrationService,
        _authService = authService,
        _imagePickerService = imagePickerService;

  final IRegistrationService _registrationService;
  final AuthService _authService;
  final IImagePickerService _imagePickerService;

  final profilePhoto = ''.obs;
  var city = ''.obs;

  Future<void> getImageProfile() async {
    final imageData = await _imagePickerService.getImageFromGallery();
    profilePhoto.value = imageData.toString();
  }

  void removePhoto() {
    profilePhoto.value = '';
  }

  Future<void> uploadImages() async {
    final user = _authService.user;

    if (user != null) {
      final userId = user.uid;
      _registrationService.uploadImages(userId, File(profilePhoto.value));
    }
  }

  Future<void> setPersonalInformations(
      UserContractorInformationModel userContractorInformationModel) async {
    try {
      final user = _authService.user;

      await _registrationService.saveContractorInformationOnStorage(
        user!.uid,
        userContractorInformationModel,
      );
    } catch (e) {
      log(e.toString());
    }
  }
}
