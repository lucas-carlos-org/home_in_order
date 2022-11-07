import 'package:get/get.dart';
import './chat_detail_controller.dart';

class ChatDetailBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(
      ChatDetailController(
        authService: Get.find(),
        chatService: Get.find(),
      ),
    );
  }
}
