import 'package:get/get.dart';
import 'package:flutter/material.dart';
import './verification_user_controller.dart';

class VerificationUserPage extends GetView<VerificationUserController> {
  const VerificationUserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
