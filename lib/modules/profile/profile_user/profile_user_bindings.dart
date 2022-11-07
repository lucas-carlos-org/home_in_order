import 'package:get/get.dart';
import './profile_user_controller.dart';

class ProfileUserBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(
      ProfileUserController(
        authService: Get.find(),
        userService: Get.find(),
        imagePickerService: Get.find(),
      ),
    );
  }
}
