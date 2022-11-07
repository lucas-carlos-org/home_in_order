import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import './menu_provider_controller.dart';

class MenuProviderPage extends GetView<MenuProviderController> {
  const MenuProviderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Navigator(
          key: Get.nestedKey(1),
          initialRoute: '/home-provider',
          onGenerateRoute: controller.onGenerateRoute,
        ),
        bottomNavigationBar: Obx(() {
          return FlashyTabBar(
            selectedIndex: controller.currentIndex.value,
            showElevation: true,
            onItemSelected: controller.changePage,
            backgroundColor: Colors.white,
            items: [
              FlashyTabBarItem(
                icon: const Icon(Icons.home),
                title: const Text('Home'),
              ),
              FlashyTabBarItem(
                icon: const Icon(Icons.event),
                title: const Text('Agenda'),
              ),
              FlashyTabBarItem(
                icon: const Icon(Icons.chat),
                title: const Text('Chats'),
              ),
              FlashyTabBarItem(
                icon: const Icon(Icons.account_circle_outlined),
                title: const Text('Perfil'),
              ),
            ],
          );
        })
        );
  }
}
