import 'package:get/get.dart';
import 'package:home_in_order/application/modules/module.dart';
import 'package:home_in_order/modules/schedule/contractor/schedule_contractor_bindings.dart';
import 'package:home_in_order/modules/schedule/contractor/schedule_contractor_page.dart';
import 'package:home_in_order/modules/schedule/schedule/schedule_bindings.dart';
import 'package:home_in_order/modules/schedule/schedule/schedule_page.dart';
import 'package:home_in_order/modules/schedule/schedule_create/schedule_create_bindings.dart';
import 'package:home_in_order/modules/schedule/schedule_create/schedule_create_page.dart';


class ScheduleModule implements Module {
  @override
  List<GetPage> routers = [
    GetPage<dynamic>(
      name: '/schedule',
      page: () => const SchedulePage(),
      binding: ScheduleBindings(),
    ),
    GetPage<dynamic>(
      name: '/schedule-create',
      page: () => ScheduleCreatePage(),
      binding: ScheduleCreateBindings(),
    ),
    GetPage<dynamic>(
      name: '/schedule-contractor',
      page: () => const ScheduleContractorPage(),
      binding: ScheduleContractorBindings(),
    ),
  ];
}
