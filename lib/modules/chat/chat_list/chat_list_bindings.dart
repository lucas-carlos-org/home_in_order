import 'package:get/get.dart';
import './chat_list_controller.dart';

class ChatListBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(
      ChatListController(
        authService: Get.find(),
        chatService: Get.find(),
      ),
    );
  }
}
