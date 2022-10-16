import 'package:get/get.dart';
import 'package:home_in_order/application/modules/module.dart';
import 'package:home_in_order/modules/schedule/schedule_bindings.dart';
import 'package:home_in_order/modules/schedule/schedule_page.dart';

class ScheduleModule implements Module {
  @override
  List<GetPage> routers = [
    GetPage<dynamic>(
      name: '/schedule',
      page: () => const SchedulePage(),
      binding: ScheduleBindings(),
    ),
  ];
}
