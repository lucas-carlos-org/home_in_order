import 'package:get/get.dart';
import './menu_contractor_controller.dart';

class MenuContractorBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(
      MenuContractorController(),
    );
  }
}
