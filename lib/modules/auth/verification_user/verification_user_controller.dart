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
      final userType = docData?['userType'];
      final completeRegistrationData = docData?['completeRegisterData'];
      final completeRegistrationPhoto = docData?['completeRegisterPhoto'];

      if (completeRegistrationPhoto == true) {
        return Get.offAllNamed('/home-provider');
      } else {
        if (userType == null) {
          return Get.offAllNamed('/onboarding');
        } else if (completeRegistrationData == null) {
          return Get.offAllNamed('/registration-provider-data');
        } else {
          return Get.offAllNamed('/registration-provider-photo');
        }
      }
    }
  }
}
