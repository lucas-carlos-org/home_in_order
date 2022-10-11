// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_in_order/application/ui/utils/extensions/size_screen_extension.dart';
import 'package:home_in_order/application/ui/widgets/custom_title.dart';
import 'package:lottie/lottie.dart';

class SuccesPage extends StatefulWidget {
  const SuccesPage({
    Key? key,
    required this.userType,
    required this.label,
  }) : super(key: key);

  final String userType;
  final String label;

  @override
  State<SuccesPage> createState() => _SuccesPageState();
}

class _SuccesPageState extends State<SuccesPage> {
  bool isGoToHome = false;
  void awaitToGoHome() {
    Future.delayed(const Duration(seconds: 6), () {
      Get.offAllNamed('/home-${widget.userType}');
    });
  }

  @override
  void initState() {
    super.initState();
    awaitToGoHome();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 22.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Lottie.asset('assets/icons/success_icon.json',
                  repeat: false, height: 250.h),
              CustomTitle(
                title: 'Cadastro Finalizado',
                subTitle: widget.label,
                isCenterTitle: false,
              ),
              const CircularProgressIndicator()
            ],
          ),
        ),
      ),
    );
  }
}
