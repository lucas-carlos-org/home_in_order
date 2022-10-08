import 'package:get/get.dart';
import './verification_user_controller.dart';

class VerificationUserBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(
      VerificationUserController(
        authService: Get.find(),
      ),
    );
  }
}
