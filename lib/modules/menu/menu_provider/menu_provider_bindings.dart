import 'package:get/get.dart';
import './menu_provider_controller.dart';

class MenuProviderBindings implements Bindings {
    @override
    void dependencies() {
        Get.put(MenuProviderController());
    }
}