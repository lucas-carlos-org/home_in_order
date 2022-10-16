import 'package:get/get.dart';
import 'package:home_in_order/application/modules/module.dart';
import 'package:home_in_order/modules/details/detail_provider/contract_provider/contract_provider_bindings.dart';
import 'package:home_in_order/modules/details/detail_provider/contract_provider/contract_provider_page.dart';
import 'package:home_in_order/modules/details/detail_provider/detail_provider/detail_provider_bindings.dart';
import 'package:home_in_order/modules/details/detail_provider/detail_provider/detail_provider_page.dart';

class DetailsModule implements Module {
  @override
  List<GetPage> routers = [
    GetPage<dynamic>(
      name: '/detail-provider',
      page: () => const DetailProviderPage(),
      binding: DetailProviderBindings(),
    ),
    GetPage<dynamic>(
      name: '/contract-provider',
      page: () => const ContractProviderPage(),
      binding: ContractProviderBindings(),
    ),
  ];
}
