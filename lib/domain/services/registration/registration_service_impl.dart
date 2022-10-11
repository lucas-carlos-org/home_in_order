import 'dart:io';

import 'package:home_in_order/domain/models/user_contractor_information_model.dart';
import 'package:home_in_order/domain/models/user_provider_information_model.dart';
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
  Future<void> saveProviderInformationOnStorage(String userId,
          UserProviderInformationModel userPersonalInformation) =>
      _registrationRepository.saveProviderInformationOnStorage(
          userId, userPersonalInformation);

  @override
  Future<void> uploadImages(String userId, File file) =>
      _registrationRepository.uploadImages(userId, file);

  @override
  Future<void> saveContractorInformationOnStorage(String userId,
          UserContractorInformationModel userContractorInformationModel) =>
      _registrationRepository.saveContractorInformationOnStorage(
          userId, userContractorInformationModel);

  @override
  Future<void> uploadListImages(String userId, List<File> files) =>
      _registrationRepository.uploadListImages(userId, files);
}
