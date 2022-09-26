import 'package:flutter/material.dart';
import 'package:home_in_order/application/ui/theme/app_colors.dart';
import 'package:home_in_order/application/ui/utils/extensions/size_screen_extension.dart';

mixin TextStyles {
  static TextStyle title = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 25.sp,
    fontFamily: 'Urbanist',
    color: AppColors.primaryColor,
  );

  static TextStyle titleMono1 = title.copyWith(
    fontWeight: FontWeight.normal,
    fontSize: 18.sp,
    color: AppColors.black,
  );

  static TextStyle titleMono2 = title.copyWith(
    fontWeight: FontWeight.normal,
    fontSize: 16.sp,
    color: AppColors.black,
  );

  static TextStyle link = title.copyWith(
    fontSize: 16.sp,
    color: AppColors.black,
  );

  static TextStyle linkPrimaryColor = title.copyWith(
    fontSize: 16.sp,
    color: AppColors.primaryColor,
  );

  static TextStyle linkPrimaryColor14 = title.copyWith(
    fontSize: 14.sp,
    color: AppColors.primaryColor,
  );

  static TextStyle linkButton = title.copyWith(
    fontWeight: FontWeight.w600,
    fontSize: 14.sp,
    color: AppColors.greyDark,
  );

  static TextStyle textButton = title.copyWith(
    fontWeight: FontWeight.w600,
    fontSize: 16.sp,
    color: Colors.white,
  );
}
