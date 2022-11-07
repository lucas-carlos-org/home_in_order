import 'package:get/get.dart';
import 'schedule_controller.dart';

class ScheduleBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(
      permanent: true,
      ScheduleController(
        authService: Get.find(),
        scheduleService: Get.find()
      ),
    );
  }
}
