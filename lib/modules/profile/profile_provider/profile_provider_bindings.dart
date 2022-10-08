import 'package:get/get.dart';
import './profile_provider_controller.dart';

class ProfileProviderBindings implements Bindings {
    @override
    void dependencies() {
        Get.put(ProfileProviderController());
    }
}