import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthService extends GetxService {
  User? user;

  Future<void> init() async {
    FirebaseAuth.instance.authStateChanges().listen(
      (
        user,
      ) async {
        this.user = user;
        if (user == null) {
          await Get.offAllNamed<dynamic>('/login');
        } else {
          await Get.offAllNamed<dynamic>('/verification-user');
        }
      },
    );
  }
}
