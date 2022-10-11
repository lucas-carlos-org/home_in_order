import 'package:flutter/material.dart';
import 'package:home_in_order/application/ui/theme/app_colors.dart';
import 'package:home_in_order/application/ui/theme/text_styles.dart';
import 'package:home_in_order/application/ui/utils/extensions/size_screen_extension.dart';

class CustomSearchWidget extends StatelessWidget {
  const CustomSearchWidget({Key? key, required this.hintText})
      : super(key: key);
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: const BorderSide(color: AppColors.greyBorder, width: 2),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: const BorderSide(color: AppColors.greyBorder, width: 2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: const BorderSide(color: AppColors.greyBorder, width: 2),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: const BorderSide(color: Color(0xffF7F8F9), width: 2),
        ),
        prefixIcon: Icon(
          Icons.search,
          color: Theme.of(context).primaryColor,
        ),
        hintText: hintText,
        hintStyle: TextStyles.titleMono2,
      ),
    );
  }
}
