import 'dart:io';

import 'package:home_in_order/domain/models/user_personal_information_model.dart';
import 'package:home_in_order/data/repositories/registration/registration_repository.dart';
import 'package:home_in_order/domain/services/registration/registration_service.dart';

class RegistrationServiceImpl implements IRegistrationService {
  RegistrationServiceImpl({
    required IRegistrationRepository registrationRepository,
  }) : _registrationRepository = registrationRepository;

  final IRegistrationRepository _registrationRepository;

  @override
  Future<void> setCompleteRegistration(String userId) =>
      _registrationRepository.setCompleteRegistration(userId);

  @override
  Future<void> saveUserPersonalgeInformationOnStorage(String userId,
          UserPersonalInformationModel userPersonalInformation) =>
      _registrationRepository.saveUserPersonalgeInformationOnStorage(
          userId, userPersonalInformation);

  @override
  Future<void> uploadImages(String userId, File file) =>
      _registrationRepository.uploadImages(userId, file);
}
