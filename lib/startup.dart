import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:home_in_order/application/bindings/application_bindings.dart';
import 'package:home_in_order/application/ui/navigator/navigator_service.dart';
import 'package:home_in_order/application/ui/notification/notification_controller.dart';
import 'package:home_in_order/application/ui/theme/home_in_order_ui_config.dart';
import 'package:home_in_order/firebase_options.dart';
import 'package:home_in_order/modules/auth/auth_module.dart';
import 'package:home_in_order/modules/chat/chat_module.dart';
import 'package:home_in_order/modules/details/details_module.dart';
import 'package:home_in_order/modules/home/home_module.dart';
import 'package:home_in_order/modules/menu/menu_module.dart';
import 'package:home_in_order/modules/onboarding/onboarding_module.dart';
import 'package:home_in_order/modules/profile/profile_module.dart';
import 'package:home_in_order/modules/registration/registration_module.dart';
import 'package:home_in_order/modules/schedule/schedule_module.dart';

Future<void> start() async {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();

    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    await NotificationController.initializeLocalNotifications(debug: true);
    await NotificationController.initializeRemoteNotifications(debug: true);
    await NotificationController.getInitialNotificationAction();

    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;

    runApp(const App());
  }, (error, stack) => FirebaseCrashlytics.instance.recordError(error, stack));
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    NotificationController().addListener(() => setState(() {}));
    NotificationController.startListeningNotificationEvents();
    NotificationController.requestFirebaseToken();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          supportedLocales: const [
            Locale('pt'),
          ],
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          defaultTransition: Transition.fadeIn,
          transitionDuration: const Duration(milliseconds: 300),
          navigatorKey: NavigationService.navigatorKey,
          theme: HomeInOrderUiConfig.theme,
          debugShowCheckedModeBanner: false,
          title: HomeInOrderUiConfig.title,
          initialBinding: ApplicationBindings(),
          getPages: [
            ...AuthModule().routers,
            ...OnboardingModule().routers,
            ...RegistrationModule().routers,
            ...HomeModule().routers,
            ...DetailsModule().routers,
            ...ProfileModule().routers,
            ...ChatModule().routers,
            ...ScheduleModule().routers,
            ...MenuModule().routers,
          ],
        );
      },
    );
  }
}
