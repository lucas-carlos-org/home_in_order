import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_in_order/modules/chat/chat_bindings.dart';
import 'package:home_in_order/modules/chat/chat_page.dart';
import 'package:home_in_order/modules/home/home_contractor/home_contractor_bindings.dart';
import 'package:home_in_order/modules/home/home_contractor/home_contractor_page.dart';
import 'package:home_in_order/modules/profile/profile_contractor/profile_contractor_bindings.dart';
import 'package:home_in_order/modules/profile/profile_contractor/profile_contractor_page.dart';


class MenuContractorController extends GetxController {
  var currentIndex = 0.obs;

  final pages = <String>[
    '/home-contractor',
    '/chats',
    '/profile-contractor'
  ];

  void changePage(int index) {
    currentIndex.value = index;
    Get.offNamed(
      pages[index],
      id: 1,
    );
  }

  Route? onGenerateRoute(RouteSettings settings) {
    if (settings.name == '/home-contractor') {
      return GetPageRoute(
        settings: settings,
        page: () => const HomeContractorPage(),
        binding: HomeContractorBindings(),
      );
    }

    if (settings.name == '/chats') {
      return GetPageRoute(
        settings: settings,
        page: () => const ChatPage(),
        binding: ChatBindings(),
      );
    }

    if (settings.name == '/profile-contractor') {
      return GetPageRoute(
        settings: settings,
        page: () => const ProfileContractorPage(),
        binding: ProfileContractorBindings(),
      );
    }

    return null;
  }
}
