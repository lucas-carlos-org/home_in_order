import 'package:get/get.dart';
import 'registration_contractor_controller.dart';

class RegistrationContractorBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(
      RegistrationContractorController(
       /*  authService: Get.find(),
        userService: Get.find(), */
      ),
    );
  }
}
