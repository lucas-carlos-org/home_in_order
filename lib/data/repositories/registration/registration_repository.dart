import 'dart:io';

import 'package:home_in_order/domain/models/user_contractor_information_model.dart';
import 'package:home_in_order/domain/models/user_provider_information_model.dart';

abstract class IRegistrationRepository {
  Future<void> setCompleteRegistration(String userId);
  Future<void> saveProviderInformationOnStorage(
      String userId, UserProviderInformationModel userProviderInformation);
  Future<void> saveContractorInformationOnStorage(String userId,
      UserContractorInformationModel userContractorInformationModel);
  Future<void> uploadImages(String userId, File file);
  Future<void> uploadListImages(String userId, List<File> files);
}
