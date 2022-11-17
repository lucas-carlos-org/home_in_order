import 'package:get/get.dart';
import './schedule_create_controller.dart';

class ScheduleCreateBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(
      ScheduleCreateController(
        scheduleService: Get.find(),
        requestServices: Get.find(),
        authService: Get.find()
      ),
    );
  }
}
