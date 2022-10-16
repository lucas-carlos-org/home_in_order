import 'package:get/get.dart';
import 'package:home_in_order/application/modules/module.dart';
import 'package:home_in_order/modules/menu/menu_contractor/menu_contractor_bindings.dart';
import 'package:home_in_order/modules/menu/menu_contractor/menu_contractor_page.dart';
import 'package:home_in_order/modules/menu/menu_provider/menu_provider_bindings.dart';
import 'package:home_in_order/modules/menu/menu_provider/menu_provider_page.dart';

class MenuModule implements Module {
  @override
  List<GetPage> routers = [
    GetPage<dynamic>(
      name: '/menu-provider',
      page: () => const MenuProviderPage(),
      binding: MenuProviderBindings(),
    ),
    GetPage<dynamic>(
      name: '/menu-contractor',
      page: () => const MenuContractorPage(),
      binding: MenuContractorBindings(),
    ),
  ];
}
