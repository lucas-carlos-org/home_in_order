import 'package:get/get.dart';
import './profile_data_controller.dart';

class ProfileDataBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(
      ProfileDataController(
        authService: Get.find(),
      ),
    );
  }
}
