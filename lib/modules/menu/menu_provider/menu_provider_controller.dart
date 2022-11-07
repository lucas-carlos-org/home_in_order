import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_in_order/modules/chat/chat_list/chat_list_bindings.dart';
import 'package:home_in_order/modules/chat/chat_list/chat_list_page.dart';
import 'package:home_in_order/modules/home/home_provider/home_provider_initial/home_provider_initial_bindings.dart';
import 'package:home_in_order/modules/home/home_provider/home_provider_initial/home_provider_initial_page.dart';
import 'package:home_in_order/modules/profile/profile_user/profile_user_bindings.dart';
import 'package:home_in_order/modules/profile/profile_user/profile_user_page.dart';
import 'package:home_in_order/modules/schedule/schedule/schedule_bindings.dart';
import 'package:home_in_order/modules/schedule/schedule/schedule_page.dart';

class MenuProviderController extends GetxController {
  var currentIndex = 0.obs;

  final pages = <String>[
    '/home-provider',
    '/schedule',
    '/chat-list',
    '/profile'
  ];

  void changePage(int index) {
    currentIndex.value = index;
    Get.offNamed(
      pages[index],
      id: 1,
    );
  }

  Route? onGenerateRoute(RouteSettings settings) {
    if (settings.name == '/home-provider') {
      return GetPageRoute(
        settings: settings,
        page: () => const HomeProviderInitialPage(),
        binding: HomeProviderInitialBindings(),
      );
    }

    if (settings.name == '/schedule') {
      return GetPageRoute(
        settings: settings,
        page: () => const SchedulePage(),
        binding: ScheduleBindings(),
      );
    }

    if (settings.name == '/chat-list') {
      return GetPageRoute(
        settings: settings,
        page: () => const ChatListPage(),
        binding: ChatListBindings(),
      );
    }

    if (settings.name == '/profile') {
      return GetPageRoute(
        settings: settings,
        page: () => const ProfileUserPage(),
        binding: ProfileUserBindings(),
      );
    }

    return null;
  }
}
