import 'dart:io';

import 'package:home_in_order/domain/models/user_personal_information_model.dart';

abstract class IRegistrationService {
Future<void> setCompleteRegistration(String userId);
Future<void> saveUserPersonalgeInformationOnStorage(String userId, UserPersonalInformationModel userPersonalInformation);
Future<void> uploadImages(String userId, File file);
}