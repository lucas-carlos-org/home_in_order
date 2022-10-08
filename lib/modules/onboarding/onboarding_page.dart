import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_in_order/application/ui/utils/extensions/size_screen_extension.dart';
import 'package:home_in_order/application/ui/widgets/custom_elevated_button.dart';

import 'package:home_in_order/application/ui/widgets/custom_title.dart';
import 'package:home_in_order/modules/onboarding/onboarding_controller.dart';
import 'package:home_in_order/modules/onboarding/widgets/onboarding_selected_button.dart';

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
              subTitle:
                  'Não se preocupe! Isso é apenas para melhorar a sua experiência dentro do aplicativo! ',
            ),
            Obx(() {
              return OnboardingSelectedButton(
                label: 'Contratante',
                onPressed: () {
                  controller.userTypeValue.value = 'contractor';
                  controller.hasUser.value = true;
                  controller.hasProvider.value = false;
                },
                isSelected: controller.hasUser.value ? true : false,
              );
            }),
            SizedBox(
              height: 12.h,
            ),
            Obx(() {
              return OnboardingSelectedButton(
                label: 'Prestador de Serviço',
                onPressed: () {
                  controller.userTypeValue.value = 'provider';
                  controller.hasProvider.value = true;
                  controller.hasUser.value = false;
                },
                isSelected: controller.hasProvider.value ? true : false,
              );
            }),
            SizedBox(
              height: 38.h,
            ),
            Obx(
              () {
                return CustomElevatedButton(
                  label: 'Começar',
                  onPressed: controller.userTypeValue.value.isEmpty ||
                          controller.userTypeValue.value == ''
                      ? null
                      : () {
                          controller.setUserType(
                            controller.userTypeValue.value,
                          );
                          Get.offNamed(
                            '/registration-${controller.userTypeValue.value}-data',
                          );
                        },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
