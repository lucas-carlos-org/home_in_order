import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:home_in_order/application/ui/theme/app_colors.dart';

import 'package:home_in_order/application/ui/utils/extensions/size_screen_extension.dart';

class CustomSocialButton extends StatelessWidget {
  const CustomSocialButton(
      {Key? key,
      required this.onPressed,
      required this.iconPath,
      required this.label})
      : super(key: key);
  final VoidCallback onPressed;
  final String iconPath;
  final String label;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 72.h,
        width: Get.size.width / 2,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(color: AppColors.greyBorder, width: 2),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                iconPath,
                height: 26.h,
                width: 26.h,
              ),
              SizedBox(
                width: 10.w,
              ),
              Text(label)
            ],
          ),
        ),
      ),
    );
  }
}
