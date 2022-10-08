// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_in_order/application/ui/utils/extensions/size_screen_extension.dart';
import 'package:home_in_order/application/ui/widgets/custom_elevated_button.dart';
import 'package:home_in_order/application/ui/widgets/custom_title.dart';
import 'package:lottie/lottie.dart';

class SuccesPage extends StatelessWidget {
  const SuccesPage({
    Key? key,
    required this.userType,
  }) : super(key: key);

  final String userType;

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
              const CustomTitle(
                title: 'Cadastro Finalizado',
                subTitle:
                    'Você finalizou a etapa de cadastro, agora basta apenas ir para a home e começar a utilizar o aplicativo! Seja bem-vindo(a)',
                isCenterTitle: true,
              ),
              CustomElevatedButton(
                label: 'Ir para home',
                onPressed: () {
                  Get.offAllNamed('/home-$userType');
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
