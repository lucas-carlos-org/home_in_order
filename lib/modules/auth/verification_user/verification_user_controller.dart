import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:home_in_order/application/auth/auth_service.dart';

class VerificationUserController extends GetxController {
  VerificationUserController({
    required AuthService authService,
  }) : _authService = authService;

  @override
  void onReady() {
    super.onReady();
    checkedUserData();
  }

  final AuthService _authService;

  Future<void> checkedUserData() async {
    final user = _authService.user;

    if (user != null) {
      final docRef = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();

      final docData = docRef.data();
      final userType = docData?['user_type'];
      final completeRegistrationData = docData?['complete_register_data'];
      final completeRegistrationPhoto = docData?['complete_register_photo'];

      if (userType == 'provider') {
        if (completeRegistrationPhoto == true) {
          return Get.offAllNamed('/menu-provider');
        } else {
          if (completeRegistrationData == null || completeRegistrationData == false) {
            return Get.offAllNamed('/registration-provider-data');
          } else if (completeRegistrationPhoto == null || completeRegistrationPhoto == false) {
            return Get.offAllNamed('/registration-provider-photo');
          }
        }
      } else if (userType == 'contractor') {
        if (completeRegistrationData == true) {
          return Get.offAllNamed('/menu-contractor');
        } else {
          if (completeRegistrationData == null || completeRegistrationData == false) {
            return Get.offAllNamed('/registration-contractor-data');
          }
        }
      } else {
        return Get.offAllNamed('/onboarding');
      }
    }
  }
}
