import 'package:get/get.dart';
import 'package:home_in_order/modules/registration/registration_provider/registration_provider_data/registration_provider_controller.dart';

class RegistrationProviderBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(
      RegistrationProviderController(
        authService: Get.find(),
        registrationService: Get.find(),
      ),
    );
  }
}
