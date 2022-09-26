// ignore_for_file: always_declare_return_types, type_annotate_public_apis

import 'dart:developer';
import 'package:get/get.dart';


class ApplicationBindings implements Bindings {
  @override
  dependencies() {
    log('|--------------------------------------');
    log('| ApplicationBindings] - Initialized! |');
    log('|--------------------------------------');
   /*  Get.put(AuthService()).init();
    Get
      ..lazyPut<IUserRepository>(() => UserRepositoryImpl(), fenix: true)
      ..lazyPut<IUserService>(() => UserServiceImpl(userRepository: Get.find()),
          fenix: true); */
  }
}
