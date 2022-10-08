import 'package:get/get.dart';
import 'package:home_in_order/modules/home/home_provider/home_provider_controller.dart';

class HomeProviderBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(
      HomeProviderController(
        userService: Get.find(),
        authService: Get.find()
      ),
    );
  }
}
