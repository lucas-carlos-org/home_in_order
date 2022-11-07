import 'package:get/get.dart';
import 'package:home_in_order/modules/details/details_active/details_active_controller.dart';

class DetailsActiveBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(
      DetailsActiveController(
        iReceiveServices: Get.find(),
        authService: Get.find()
      ),
    );
  }
}
