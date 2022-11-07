import 'package:get/get.dart';
import './historic_controller.dart';

class HistoricBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(
      HistoricController(
        authService: Get.find(),
      ),
    );
  }
}
