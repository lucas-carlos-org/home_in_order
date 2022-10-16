import 'package:get/get.dart';
import 'package:home_in_order/application/modules/module.dart';
import 'package:home_in_order/modules/home/home_contractor/home_contractor_bindings.dart';
import 'package:home_in_order/modules/home/home_contractor/home_contractor_page.dart';
import 'package:home_in_order/modules/home/home_provider/home_provider_initial/home_provider_initial_bindings.dart';
import 'package:home_in_order/modules/home/home_provider/home_provider_initial/home_provider_initial_page.dart';

class HomeModule implements Module {
  @override
  List<GetPage> routers = [
    GetPage<dynamic>(
      name: '/home-contractor',
      page: () => const HomeContractorPage(),
      binding: HomeContractorBindings(),
    ),
    GetPage<dynamic>(
      name: '/home-provider',
      page: () => const HomeProviderInitialPage(),
      binding: HomeProviderInitialBindings(),
    ),
  ];
}
