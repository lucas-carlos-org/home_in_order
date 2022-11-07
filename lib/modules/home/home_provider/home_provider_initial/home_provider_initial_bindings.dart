import 'package:get/get.dart';
import 'package:home_in_order/modules/home/home_provider/home_provider_initial/home_provider_initial_controller.dart';

class HomeProviderInitialBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(
      permanent: true,
      HomeProviderInitialController(
        userService: Get.find(),
        authService: Get.find(),
        receiveServices: Get.find(),
      ),
    );
  }
}
