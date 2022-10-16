import 'package:get/get.dart';
import 'package:home_in_order/application/modules/module.dart';
import 'package:home_in_order/modules/chat/chat_bindings.dart';
import 'package:home_in_order/modules/chat/chat_page.dart';

class ChatModule implements Module {
  @override
  List<GetPage> routers = [
    GetPage<dynamic>(
      name: '/chat',
      page: () => const ChatPage(),
      binding: ChatBindings(),
    ),
  ];
}
