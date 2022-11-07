import 'package:get/get.dart';
import 'package:home_in_order/application/modules/module.dart';
import 'package:home_in_order/modules/chat/chat_detail/chat_detail_bindings.dart';
import 'package:home_in_order/modules/chat/chat_detail/chat_detail_page.dart';
import 'package:home_in_order/modules/chat/chat_list/chat_list_bindings.dart';
import 'package:home_in_order/modules/chat/chat_list/chat_list_page.dart';

class ChatModule implements Module {
  @override
  List<GetPage> routers = [
    GetPage<dynamic>(
      name: '/chat-list',
      page: () => const ChatListPage(),
      binding: ChatListBindings(),
    ),
    GetPage<dynamic>(
      name: '/chat-detail',
      page: () => const ChatDetailPage(),
      binding: ChatDetailBindings(),
    ),
  ];
}
