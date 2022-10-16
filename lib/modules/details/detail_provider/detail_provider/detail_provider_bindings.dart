import 'package:get/get.dart';
import './detail_provider_controller.dart';

class DetailProviderBindings implements Bindings {
    @override
    void dependencies() {
        Get.put(DetailProviderController());
    }
}