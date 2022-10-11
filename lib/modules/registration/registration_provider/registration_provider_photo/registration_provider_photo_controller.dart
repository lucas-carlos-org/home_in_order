import 'dart:io';

import 'package:get/get.dart';
import 'package:home_in_order/application/auth/auth_service.dart';
import 'package:home_in_order/domain/services/image_picker/image_picker_service.dart';
import 'package:home_in_order/domain/services/registration/registration_service.dart';

class RegistrationProviderPhotoController extends GetxController {
  RegistrationProviderPhotoController({
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
  final jobPhotoOne = ''.obs;
  final jobPhotoTwo = ''.obs;
  final jobPhotoThree = ''.obs;
  final jobPhotoFour = ''.obs;
  final jobPhotoFive = ''.obs;
  final jobPhotoSix = ''.obs;
  var listOfImages = <File>[].obs;

  Future<void> setCompleteRegistration() async {
    final user = _authService.user;
    await _registrationService.setCompleteRegistration(user!.uid);
  }

  Future<void> getImageProfile() async {
    final imageData = await _imagePickerService.getImageFromGallery();
    profilePhoto.value = imageData.toString();
  }

  Future<void> getImageJob(RxString stringVal) async {
    final imageData = await _imagePickerService.getImageFromGallery();
    stringVal.value = imageData.toString();
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

  Future<void> uploadListOfImages() async {
    final user = _authService.user;

    if (jobPhotoOne.value.isNotEmpty) {
      listOfImages.add(File(jobPhotoOne.value));
    }
    if (jobPhotoTwo.value.isNotEmpty) {
      listOfImages.add(File(jobPhotoTwo.value));
    }
    if (jobPhotoThree.value.isNotEmpty) {
      listOfImages.add(File(jobPhotoThree.value));
    }
    if (jobPhotoFour.value.isNotEmpty) {
      listOfImages.add(File(jobPhotoFour.value));
    }
    if (jobPhotoFive.value.isNotEmpty) {
      listOfImages.add(File(jobPhotoFive.value));
    }
    if (jobPhotoSix.value.isNotEmpty) {
      listOfImages.add(File(jobPhotoSix.value));
    }

    if (user != null) {
      final userId = user.uid;
      _registrationService.uploadListImages(userId, listOfImages);
    }
  }
}
