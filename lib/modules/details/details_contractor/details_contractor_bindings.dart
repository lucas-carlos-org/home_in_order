import 'package:get/get.dart';
import './details_contractor_controller.dart';

class DetailsContractorBindings implements Bindings {
    @override
    void dependencies() {
        Get.put(DetailsContractorController(
          authService: Get.find(),
          receiveServices: Get.find(),
          chatService: Get.find()
        ));
    }
}