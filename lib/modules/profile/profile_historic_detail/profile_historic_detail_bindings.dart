import 'package:get/get.dart';
import './profile_historic_detail_controller.dart';

class ProfileHistoricDetailBindings implements Bindings {
    @override
    void dependencies() {
        Get.put(ProfileHistoricDetailController());
    }
}