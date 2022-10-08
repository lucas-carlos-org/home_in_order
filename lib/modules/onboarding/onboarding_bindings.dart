import 'package:get/get.dart';
import 'package:home_in_order/modules/onboarding/onboarding_controller.dart';


class OnboardingBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(
      OnboardingController(
        authService: Get.find(),
        userService: Get.find(),
      ),
    );
  }
}
