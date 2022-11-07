import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:home_in_order/application/ui/theme/app_colors.dart';
import 'package:home_in_order/application/ui/utils/extensions/size_screen_extension.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton(
      {Key? key,
      this.heightContainer,
      this.widthContainer,
      this.heightIcon,
      this.widthIcon})
      : super(key: key);

  final double? heightContainer;
  final double? widthContainer;
  final double? heightIcon;
  final double? widthIcon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.back(),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 22.h, horizontal: 12.w),
        child: Container(
          height: heightContainer ?? 41.h,
          width: widthContainer ?? 41.w,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: AppColors.greyBorder,
            ),
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Center(
            child: SvgPicture.asset(
              'assets/icons/back.svg',
              height: heightIcon ?? 19.h,
              width: widthIcon ?? 19.w,
            ),
          ),
        ),
      ),
    );
  }
}
