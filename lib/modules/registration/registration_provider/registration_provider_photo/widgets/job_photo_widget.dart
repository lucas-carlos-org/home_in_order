import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_in_order/application/ui/utils/extensions/size_screen_extension.dart';
import 'package:home_in_order/modules/registration/registration_provider/registration_provider_photo/registration_provider_photo_controller.dart';

class JobPhotoWidget extends GetView<RegistrationProviderPhotoController> {
  const JobPhotoWidget(
      {Key? key, required this.photoFile, required this.onPressed})
      : super(key: key);

  final RxString photoFile;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return InkWell(
          onTap: onPressed,
          child: Container(
            decoration: BoxDecoration(
              border:
                  Border.all(width: 0.2, color: Theme.of(context).primaryColor),
              borderRadius: BorderRadius.circular(8.r),
            ),
            height: 90.h,
            width: 90.w,
            child: photoFile.isEmpty
                ? Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                          width: 1, color: Theme.of(context).primaryColor),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    height: 90.h,
                    width: 90.w,
                    child: Icon(
                      Icons.image_outlined,
                      color: Theme.of(context).primaryColor,
                      size: 20.sp,
                    ),
                  )
                : Container(
                    height: 90.h,
                    width: 90.w,
                    decoration: BoxDecoration(
                      border: Border.all(
                          width: 1, color: Theme.of(context).primaryColor),
                      borderRadius: BorderRadius.circular(8.r),
                      image: DecorationImage(
                        image: FileImage(
                          File(
                            photoFile.value,
                          ),
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
          ),
        );
      },
    );
  }
}
