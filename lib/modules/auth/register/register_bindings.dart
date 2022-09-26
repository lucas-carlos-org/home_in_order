import 'package:get/get.dart';
import 'package:home_in_order/modules/auth/register/register_controller.dart';

class RegisterBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(
      RegisterController(),
    );
  }
}
