import 'package:get/get.dart';
import 'package:home_in_order/application/modules/module.dart';
import 'package:home_in_order/modules/profile/profile_data/profile_data_bindings.dart';
import 'package:home_in_order/modules/profile/profile_data/profile_data_page.dart';
import 'package:home_in_order/modules/profile/profile_historic/historic_bindings.dart';
import 'package:home_in_order/modules/profile/profile_historic/historic_page.dart';
import 'package:home_in_order/modules/profile/profile_historic_detail/profile_historic_detail_bindings.dart';
import 'package:home_in_order/modules/profile/profile_historic_detail/profile_historic_detail_page.dart';
import 'package:home_in_order/modules/profile/profile_user/profile_user_bindings.dart';
import 'package:home_in_order/modules/profile/profile_user/profile_user_page.dart';

class ProfileModule implements Module {
  @override
  List<GetPage> routers = [
    GetPage<dynamic>(
      name: '/profile',
      page: () => const ProfileUserPage(),
      binding: ProfileUserBindings(),
    ),
    GetPage<dynamic>(
      name: '/profile-data',
      page: () => const ProfileDataPage(),
      binding: ProfileDataBindings(),
    ),
    GetPage<dynamic>(
      name: '/historic',
      page: () => const HistoricPage(),
      binding: HistoricBindings(),
    ),
    GetPage<dynamic>(
      name: '/historic-detail',
      page: () => const ProfileHistoricDetailPage(),
      binding: ProfileHistoricDetailBindings(),
    ),
  ];
}
