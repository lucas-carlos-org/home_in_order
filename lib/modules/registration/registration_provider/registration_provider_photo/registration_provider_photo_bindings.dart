import 'package:get/get.dart';
import './registration_provider_photo_controller.dart';

class RegistrationProviderPhotoBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(
      RegistrationProviderPhotoController(
        registrationService: Get.find(),
        authService: Get.find(),
        imagePickerService: Get.find()
      ),
    );
  }
}
