import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_in_order/application/ui/utils/extensions/size_screen_extension.dart';
import 'package:home_in_order/application/ui/widgets/custom_elevated_button.dart';
import 'package:home_in_order/application/ui/widgets/succes_page.dart';
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
              SizedBox(
                height: 8.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  JobPhotoWidget(
                    photoFile: controller.jobPhotoOne,
                    onPressed: () => controller.getImageJob(
                      controller.jobPhotoOne,
                    ),
                  ),
                  JobPhotoWidget(
                    photoFile: controller.jobPhotoTwo,
                    onPressed: () => controller.getImageJob(
                      controller.jobPhotoTwo,
                    ),
                  ),
                  JobPhotoWidget(
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
                    photoFile: controller.jobPhotoFour,
                    onPressed: () => controller.getImageJob(
                      controller.jobPhotoFour,
                    ),
                  ),
                  JobPhotoWidget(
                    photoFile: controller.jobPhotoFive,
                    onPressed: () => controller.getImageJob(
                      controller.jobPhotoFive,
                    ),
                  ),
                  JobPhotoWidget(
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
          CustomElevatedButton(
            onPressed: () {
              if (controller.profilePhoto.isNotEmpty &&
                  controller.jobPhotoOne.isNotEmpty &&
                  controller.jobPhotoTwo.isNotEmpty &&
                  controller.jobPhotoThree.isNotEmpty &&
                  controller.jobPhotoFive.isNotEmpty &&
                  controller.jobPhotoFive.isNotEmpty &&
                  controller.jobPhotoSix.isNotEmpty) {
                controller.uploadImages();
                controller.setCompleteRegistration();
                Get.offAll(
                  const SuccesPage(userType: 'provider'),
                );
              }
            },
            label: 'Continuar',
          ),
        ],
      ),
    );
  }
}
