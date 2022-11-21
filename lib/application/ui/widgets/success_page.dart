// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_in_order/application/ui/utils/extensions/size_screen_extension.dart';
import 'package:home_in_order/application/ui/widgets/custom_title.dart';
import 'package:lottie/lottie.dart';

class SuccessPage extends StatefulWidget {
  const SuccessPage({
    Key? key,
    required this.userType,
    required this.label,
  }) : super(key: key);

  final String userType;
  final String label;

  @override
  State<SuccessPage> createState() => _SuccessPageState();
}

class _SuccessPageState extends State<SuccessPage> {
  bool isGoToHome = false;
  void awaitToGoHome() {
    Future.delayed(const Duration(seconds: 5), () {
      Get.offAllNamed('/menu-${widget.userType}');
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
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 22.w),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 39.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 0.h,
                width: 0.w,
              ),
              Column(
                children: [
                  Lottie.asset('assets/icons/success_icon.json',
                      repeat: false, height: 250.h),
                  CustomTitle(
                    title: 'Cadastro Finalizado',
                    subTitle: widget.label,
                    isCenterTitle: true,
                    isCenterSubtitle: true,
                  ),
                ],
              ),
              const CupertinoActivityIndicator(
                animating: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
