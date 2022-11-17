import 'package:get/get.dart';
import 'package:home_in_order/modules/schedule/contractor/schedule_contractor_controller.dart';

class ScheduleContractorBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(
      ScheduleContractorController(authService: Get.find()),
    );
  }
}
