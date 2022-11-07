import 'package:get/get.dart';
import './contract_provider_controller.dart';

class ContractProviderBindings implements Bindings {
    @override
    void dependencies() {
        Get.put(ContractProviderController(
          requestService: Get.find(),
          authService: Get.find(),
          imagePickerService: Get.find()
        ));
    }
}