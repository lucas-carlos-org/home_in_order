import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:home_in_order/application/auth/auth_service.dart';
import 'package:home_in_order/domain/models/chat_message_model.dart';
import 'package:home_in_order/domain/services/chat/chat_service.dart';
import 'package:home_in_order/modules/menu/menu_provider/menu_provider_controller.dart';

class ChatDetailController extends GetxController {
  ChatDetailController({
    required AuthService authService,
    required IChatService chatService,
    require,
  })  : _authService = authService,
        _chatService = chatService;

  @override
  void onInit() {
    messages = RxList.empty();
    super.onInit();
    final data = Get.arguments;
    receiverId = data[0];
    userName.value = data[1];
    getUserType();
    onMessageReceiver();
  }

  final AuthService _authService;
  final IChatService _chatService;
  late RxList<ChatMessageModel> messages;
  String? receiverId;
  var userName = ''.obs;
  var userType = ''.obs;

  Future<void> sendMessage(String message) async {
    final senderId = _authService.user;

    if (senderId != null) {
      await _chatService.sendMessage(senderId.uid, receiverId!, message);
    }
  }

  void changePage(int index){
    Get.put(MenuProviderController()).changePage(index);
  }

  Future<void> onMessageReceiver() async {
    final senderId = _authService.user;

    if (senderId != null) {
      await _chatService.onChatMessageReceiver(
        senderId.uid,
        receiverId!,
        (p0) {
          messages.add(p0);
          messages
              .sort((a, b) => a.createdAt?.compareTo(b.createdAt ?? 0) ?? 0);
        },
      );
    }
  }

  bool isFromMe(String id) {
    final userId = _authService.user!.uid;
    return userId == id;
  }

  Future<void> getUserType() async {
    final userId = _authService.user!.uid;
    final userRef =
        await FirebaseFirestore.instance.collection('users').doc(userId).get();
    userType(userRef['user_type']);
  }
}
