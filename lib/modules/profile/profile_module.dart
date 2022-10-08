import 'package:get/get.dart';
import 'package:home_in_order/application/modules/module.dart';
import 'package:home_in_order/modules/profile/profile_contractor/profile_contractor_bindings.dart';
import 'package:home_in_order/modules/profile/profile_contractor/profile_contractor_page.dart';
import 'package:home_in_order/modules/profile/profile_provider/profile_provider_bindings.dart';
import 'package:home_in_order/modules/profile/profile_provider/profile_provider_page.dart';

class ProfileModule implements Module {
  @override
  List<GetPage> routers = [
    GetPage<dynamic>(
      name: '/profile-contractor',
      page: () => const ProfileContractorPage(),
      binding: ProfileContractorBindings(),
    ),
    GetPage<dynamic>(
      name: '/profile-provider',
      page: () => const ProfileProviderPage(),
      binding: ProfileProviderBindings(),
    ),
  ];
}
