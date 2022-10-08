import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_in_order/application/ui/theme/app_colors.dart';
import 'package:home_in_order/application/ui/theme/text_styles.dart';
import 'package:home_in_order/application/ui/utils/extensions/size_screen_extension.dart';
import 'package:home_in_order/modules/onboarding/onboarding_controller.dart';

class OnboardingSelectedButton
    extends GetView<OnboardingController> {
  const OnboardingSelectedButton({
    Key? key,
    required this.label,
    this.color,
    this.labelColor = Colors.white,
    this.onPressed,
    this.isSelected = false,
  }) : super(key: key);
  final String label;
  final Color? color;
  final Color? labelColor;
  final VoidCallback? onPressed;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 56.h,
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.grey,
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(
            color: isSelected ? AppColors.primaryColor : AppColors.greyBorder,
          ),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyles.textButton.copyWith(
                color: isSelected ? AppColors.primaryColor : Colors.grey),
          ),
        ),
      ),
    );
  }
}
