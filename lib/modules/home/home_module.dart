import 'package:get/get.dart';
import 'package:home_in_order/application/modules/module.dart';
import 'package:home_in_order/modules/home/home_provider/home_provider_bindings.dart';
import 'package:home_in_order/modules/home/home_provider/home_provider_page.dart';
import 'package:home_in_order/modules/home/home_user/home_user_bindings.dart';
import 'package:home_in_order/modules/home/home_user/home_user_page.dart';


class HomeModule implements Module {
  @override
  List<GetPage> routers = [
    GetPage<dynamic>(
      name: '/home-user',
      page: () => const HomeUserPage(),
      binding: HomeUserBindings(),
    ),
    GetPage<dynamic>(
      name: '/home-provider',
      page: () => const HomeProviderPage(),
      binding: HomeProviderBindings(),
    ),
  ];
}
