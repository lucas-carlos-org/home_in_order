import 'package:get/get.dart';
import 'package:home_in_order/application/modules/module.dart';
import 'package:home_in_order/modules/details/detail_provider/contract_provider/contract_provider_bindings.dart';
import 'package:home_in_order/modules/details/detail_provider/contract_provider/contract_provider_page.dart';
import 'package:home_in_order/modules/details/detail_provider/detail_provider/detail_provider_bindings.dart';
import 'package:home_in_order/modules/details/detail_provider/detail_provider/detail_provider_page.dart';
import 'package:home_in_order/modules/details/details_active/details_active_bindings.dart';
import 'package:home_in_order/modules/details/details_active/details_active_page.dart';
import 'package:home_in_order/modules/details/details_contractor/details_contractor_bindings.dart';
import 'package:home_in_order/modules/details/details_contractor/details_contractor_page.dart';

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
    GetPage<dynamic>(
      name: '/detail-contractor',
      page: () => const DetailsContractorPage(),
      binding: DetailsContractorBindings(),
    ),
    GetPage<dynamic>(
      name: '/detail-active',
      page: () => const DetailsActivePage(),
      binding: DetailsActiveBindings(),
    ),
  ];
}
