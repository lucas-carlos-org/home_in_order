import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:home_in_order/application/bindings/application_bindings.dart';
import 'package:home_in_order/application/ui/theme/home_in_order_ui_config.dart';
import 'package:home_in_order/modules/auth/auth_module.dart';
import 'package:home_in_order/modules/onboarding/onboarding_module.dart';

Future<void> start() async {
  WidgetsFlutterBinding.ensureInitialized();
  /* await Firebase.initializeApp(); */
  runApp(const App());
/*   runZonedGuarded<Future<void>>(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
      FlutterError.onError =
          FirebaseCrashlytics.instance.recordFlutterFatalError;
      runApp(const App());
    },
    (error, stack) =>
        FirebaseCrashlytics.instance.recordError(error, stack, fatal: true),
  ); */
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          defaultTransition: Transition.fadeIn,
          transitionDuration: const Duration(milliseconds: 300),
          theme: HomeInOrderUiConfig.theme,
          debugShowCheckedModeBanner: false,
          title: HomeInOrderUiConfig.title,
          initialBinding: ApplicationBindings(),
          getPages: [
            ...AuthModule().routers,
            ...OnboardingModule().routers,
           /*  ...HomeUserModule().routers,
            ...HomeProviderModule().routers, */
          ],
        );
      },
    );
  }
}
