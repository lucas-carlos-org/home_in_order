import 'package:get/get.dart';
import 'package:home_in_order/modules/home/home_user/home_user_controller.dart';

class HomeUserBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(
      HomeUserController(),
    );
  }
}
