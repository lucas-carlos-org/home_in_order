import 'package:get/get.dart';
import './profile_contractor_controller.dart';

class ProfileContractorBindings implements Bindings {
    @override
    void dependencies() {
        Get.put(ProfileContractorController());
    }
}