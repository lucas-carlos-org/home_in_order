import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_in_order/application/ui/utils/extensions/size_screen_extension.dart';
import 'package:home_in_order/application/ui/widgets/custom_elevated_button.dart';
import 'package:home_in_order/modules/onboarding/widgets/onboarding_selected_button.dart';
import 'package:home_in_order/application/ui/widgets/custom_title.dart';
import 'package:home_in_order/modules/onboarding/onboarding_controller.dart';

class OnboardingPage extends GetView<OnboardingController> {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 22.w),
        child: Column(
          children: [
            const CustomTitle(
                title: 'Qual usuário você será? ',
                subTitle: 'Não se preocupe! Isso é apenas para melhorar a sua experiência dentro do aplicativo! '),
            OnboardingSelectedButton(
              label: 'Usuário',
              onPressed: () {
                Get.toNamed('/home-user');
              },
            ),
            SizedBox(
              height: 12.h,
            ),
            OnboardingSelectedButton(
              label: 'Prestador de Serviço',
              isSelected: true,
              onPressed: () {
                Get.toNamed('/home-provider');
              },
            ),
            SizedBox(
              height: 38.h,
            ),
            CustomElevatedButton(
              label: 'Começar',
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
