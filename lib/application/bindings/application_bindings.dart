// ignore_for_file: always_declare_return_types, type_annotate_public_apis

import 'dart:developer';
import 'package:get/get.dart';
import 'package:home_in_order/application/auth/auth_service.dart';
import 'package:home_in_order/data/gateways/image_picker/image_picker_gateway.dart';
import 'package:home_in_order/data/repositories/image_picker/image_picker_repository.dart';
import 'package:home_in_order/data/repositories/image_picker/image_picker_repository_impl.dart';
import 'package:home_in_order/data/repositories/registration/registration_repository.dart';
import 'package:home_in_order/data/repositories/registration/registration_repository_impl.dart';
import 'package:home_in_order/data/repositories/request_services/request_services_repository.dart';
import 'package:home_in_order/data/repositories/request_services/request_services_repository_impl.dart';
import 'package:home_in_order/data/repositories/user/user_repository.dart';
import 'package:home_in_order/data/repositories/user/user_repository_impl.dart';
import 'package:home_in_order/domain/services/image_picker/image_picker_service.dart';
import 'package:home_in_order/domain/services/image_picker/image_picker_service_impl.dart';
import 'package:home_in_order/domain/services/registration/registration_service.dart';
import 'package:home_in_order/domain/services/registration/registration_service_impl.dart';
import 'package:home_in_order/domain/services/request_services/request_service.dart';
import 'package:home_in_order/domain/services/request_services/request_service_impl.dart';
import 'package:home_in_order/domain/services/user/user_service.dart';
import 'package:home_in_order/domain/services/user/user_service_impl.dart';

class ApplicationBindings implements Bindings {
  @override
  dependencies() {
    log('|--------------------------------------');
    log('| ApplicationBindings] - Initialized! |');
    log('|--------------------------------------');
    Get.put(AuthService()).init();
    Get
      ..lazyPut<IUserRepository>(() => UserRepositoryImpl(), fenix: true)
      ..lazyPut<IUserService>(() => UserServiceImpl(userRepository: Get.find()),
          fenix: true);
    Get
      ..lazyPut<IRegistrationRepository>(() => RegistrationRepositoryImpl(),
          fenix: true)
      ..lazyPut<IRegistrationService>(
          () => RegistrationServiceImpl(registrationRepository: Get.find()),
          fenix: true);

    Get
      ..lazyPut<IImageGateway>(() => ImageGatewayImpl(), fenix: true)
      ..lazyPut<IImagePickerRepository>(
          () => ImagePickerRepositoryImpl(imageGateway: Get.find()),
          fenix: true)
      ..lazyPut<IImagePickerService>(
          () => ImagePickerServiceImpl(imagePickerRepository: Get.find()),
          fenix: true);

    Get
      ..lazyPut<IRequestServicesRepository>(
          () => RequestServicesRepositoryImpl(),
          fenix: true)
      ..lazyPut<IRequestService>(
          () => RequestServiceImpl(requestServicesRepository: Get.find()),
          fenix: true);
  }
}
