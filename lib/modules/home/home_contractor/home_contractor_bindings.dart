import 'package:get/get.dart';
import 'package:home_in_order/modules/home/home_contractor/home_contractor_controller.dart';

class HomeContractorBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(
      HomeContractorController(
        authService: Get.find(),
      ),
    );
  }
}
