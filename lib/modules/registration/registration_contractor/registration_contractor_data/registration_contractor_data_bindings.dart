import 'package:get/get.dart';
import './registration_contractor_data_controller.dart';

class RegistrationContractorDataBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(
      RegistrationContractorDataController(
        authService: Get.find(),
        imagePickerService: Get.find(),
        registrationService: Get.find(),
      ),
    );
  }
}
