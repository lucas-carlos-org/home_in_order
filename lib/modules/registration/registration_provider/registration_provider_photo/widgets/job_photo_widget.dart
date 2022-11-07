import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_in_order/application/ui/utils/extensions/size_screen_extension.dart';
import 'package:home_in_order/modules/registration/registration_provider/registration_provider_photo/registration_provider_photo_controller.dart';

class JobPhotoWidget extends GetView<RegistrationProviderPhotoController> {
  const JobPhotoWidget({
    Key? key,
    required this.photoFile,
    required this.onPressed,
    required this.number,
  }) : super(key: key);

  final RxString photoFile;
  final VoidCallback onPressed;
  final String number;

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
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          number,
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 12.sp),
                        ),
                        Icon(
                          Icons.image_outlined,
                          color: Theme.of(context).primaryColor,
                          size: 20.sp,
                        ),
                      ],
                    ),
                  )
                : Stack(
                    children: [
                      Container(
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
                      Positioned.fill(
                        child: Align(
                          alignment: Alignment.topRight,
                          child: Padding(
                            padding: const EdgeInsets.all(2),
                            child: InkWell(
                              onTap: () =>
                                  controller.removePhotoFromList(photoFile),
                              child: Container(
                                height: 20.h,
                                width: 20.w,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(
                                    50.r,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 2,
                                      blurRadius: 3,
                                      offset: const Offset(
                                          0, 2), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: Icon(
                                  Icons.close_rounded,
                                  color: Theme.of(context).primaryColor,
                                  size: 20.sp,
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
          ),
        );
      },
    );
  }
}
