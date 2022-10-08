import 'dart:developer';

import 'package:get/get.dart';
import 'package:home_in_order/application/auth/auth_service.dart';
import 'package:home_in_order/domain/models/user_personal_information_model.dart';
import 'package:home_in_order/domain/services/registration/registration_service.dart';

class RegistrationProviderController extends GetxController {
  final cityData = ['Torres', 'Capão da Canoa', 'Três Cachoeirras'];

  RegistrationProviderController({
    required IRegistrationService registrationService,
    required AuthService authService,
  })  : _registrationService = registrationService,
        _authService = authService;

  final IRegistrationService _registrationService;
  final AuthService _authService;
  var hasCpf = false.obs;
  var hasCnpj = false.obs;
  var city = ''.obs;


  Future<void> setPersonalInformations(
      UserPersonalInformationModel userAuthModel) async {
    try {
      final user = _authService.user;

      await _registrationService.saveUserPersonalgeInformationOnStorage(
        user!.uid,
        userAuthModel,
      );
    } catch (e) {
      log(e.toString());
    }
  }
}
