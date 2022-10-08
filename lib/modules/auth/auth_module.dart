// ignore_for_file: unnecessary_lambdas

import 'package:get/get.dart';
import 'package:home_in_order/application/modules/module.dart';
import 'package:home_in_order/modules/auth/forgot_password/forgot_password_bindings.dart';
import 'package:home_in_order/modules/auth/forgot_password/forgot_password_page.dart';
import 'package:home_in_order/modules/auth/login/login_bindings.dart';
import 'package:home_in_order/modules/auth/login/login_page.dart';
import 'package:home_in_order/modules/auth/register/register_bindings.dart';
import 'package:home_in_order/modules/auth/register/register_page.dart';
import 'package:home_in_order/modules/auth/verification_user/verification_user_bindings.dart';
import 'package:home_in_order/modules/auth/verification_user/verification_user_page.dart';


class AuthModule implements Module {
  @override
  List<GetPage> routers = [
    GetPage<dynamic>(
      name: '/',
      page: () => const LoginPage(),
      binding: LoginBindings(),
    ),
    GetPage<dynamic>(
      name: '/register',
      page: () => const RegisterPage(),
      binding: RegisterBindings(),
    ),
    GetPage<dynamic>(
      name: '/forgot-password',
      page: () => const ForgotPasswordPage(),
      binding: ForgotPasswordBindings(),
    ),
    GetPage<dynamic>(
      name: '/verification-user',
      page: () => const VerificationUserPage(),
      binding: VerificationUserBindings(),
    ),
  ];
}
