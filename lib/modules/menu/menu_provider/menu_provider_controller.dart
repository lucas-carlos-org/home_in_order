import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_in_order/modules/chat/chat_bindings.dart';
import 'package:home_in_order/modules/chat/chat_page.dart';
import 'package:home_in_order/modules/home/home_provider/home_provider_initial/home_provider_initial_bindings.dart';
import 'package:home_in_order/modules/home/home_provider/home_provider_initial/home_provider_initial_page.dart';
import 'package:home_in_order/modules/profile/profile_provider/profile_provider_bindings.dart';
import 'package:home_in_order/modules/profile/profile_provider/profile_provider_page.dart';
import 'package:home_in_order/modules/schedule/schedule_bindings.dart';
import 'package:home_in_order/modules/schedule/schedule_page.dart';

class MenuProviderController extends GetxController {
  var currentIndex = 0.obs;

  final pages = <String>[
    '/home-provider',
    '/schedule',
    '/chats',
    '/profile-provider'
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

    if (settings.name == '/chats') {
      return GetPageRoute(
        settings: settings,
        page: () => const ChatPage(),
        binding: ChatBindings(),
      );
    }

    if (settings.name == '/profile-provider') {
      return GetPageRoute(
        settings: settings,
        page: () => const ProfileProviderPage(),
        binding: ProfileProviderBindings(),
      );
    }

    return null;
  }
}
