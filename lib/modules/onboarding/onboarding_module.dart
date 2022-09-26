// ignore_for_file: unnecessary_lambdas

import 'package:get/get.dart';
import 'package:home_in_order/application/modules/module.dart';
import 'package:home_in_order/modules/onboarding/onboarding_bindings.dart';
import 'package:home_in_order/modules/onboarding/onboarding_page.dart';

class OnboardingModule implements Module {
  @override
  List<GetPage> routers = [
    GetPage<dynamic>(
      name: '/onboarding',
      page: () => const OnboardingPage(),
      binding: OnboardingBindings(),
    ),
  ];
}
