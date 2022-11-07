import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_in_order/application/ui/utils/extensions/size_screen_extension.dart';
import 'package:home_in_order/application/ui/widgets/custom_elevated_button.dart';
import 'package:home_in_order/application/ui/widgets/success_page.dart';
import 'package:home_in_order/modules/registration/registration_provider/registration_provider_photo/registration_provider_photo_controller.dart';
import 'package:home_in_order/modules/registration/registration_provider/registration_provider_photo/widgets/job_photo_widget.dart';
import 'package:home_in_order/modules/registration/registration_provider/registration_provider_photo/widgets/profile_photo_widget.dart';

class RegistrationPhotoForm
    extends GetView<RegistrationProviderPhotoController> {
  const RegistrationPhotoForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 22.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: [
              Text(
                'Foto de perfil',
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 8.h,
              ),
              const ProfilePhotoWidget()
            ],
          ),
          SizedBox(
            height: 40.h,
          ),
          Column(
            children: [
              Text(
                'Foto do seu serviço',
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
              ),
              Text(
                '* Obrigatório pelo menos as três primeiras fotos!',
                style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: 8.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  JobPhotoWidget(
                    number: '1',
                    photoFile: controller.jobPhotoOne,
                    onPressed: () => controller.getImageJob(
                      controller.jobPhotoOne,
                    ),
                  ),
                  JobPhotoWidget(
                    number: '2',
                    photoFile: controller.jobPhotoTwo,
                    onPressed: () => controller.getImageJob(
                      controller.jobPhotoTwo,
                    ),
                  ),
                  JobPhotoWidget(
                    number: '3',
                    photoFile: controller.jobPhotoThree,
                    onPressed: () => controller.getImageJob(
                      controller.jobPhotoThree,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  JobPhotoWidget(
                    number: '4',
                    photoFile: controller.jobPhotoFour,
                    onPressed: () {
                      controller.getImageJob(
                        controller.jobPhotoFour,
                      );
                    },
                  ),
                  JobPhotoWidget(
                    number: '5',
                    photoFile: controller.jobPhotoFive,
                    onPressed: () => controller.getImageJob(
                      controller.jobPhotoFive,
                    ),
                  ),
                  JobPhotoWidget(
                    number: '6',
                    photoFile: controller.jobPhotoSix,
                    onPressed: () => controller.getImageJob(
                      controller.jobPhotoSix,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 16.h,
          ),
          Obx(
            () {
              return CustomElevatedButton(
                onPressed: (controller.profilePhoto.isEmpty ||
                        controller.jobPhotoOne.value.isEmpty ||
                        controller.jobPhotoTwo.value.isEmpty ||
                        controller.jobPhotoThree.value.isEmpty)
                    ? null
                    : () {
                        controller.uploadImages();
                        controller.uploadListOfImages();
                        controller.setCompleteRegistration();
                        Get.offAll(
                          const SuccessPage(
                              userType: 'provider',
                              label:
                                  'Você finalizou a etapa de cadastro, aguarde enquanto preparamos tudo para você!'),
                        );
                      },
                label: 'Continuar',
              );
            },
          ),
        ],
      ),
    );
  }
}
