import 'package:flutter/material.dart';
import 'package:home_in_order/application/ui/theme/app_colors.dart';
import 'package:home_in_order/application/ui/theme/text_styles.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    Key? key,
    required this.label,
    this.heigth = 56,
    this.width = double.infinity,
    this.padding = 10,
    this.color,
    this.labelColor = Colors.white,
    this.borderRadius = 8,
    this.onPressed,
  }) : super(key: key);

  final String label;
  final double heigth;
  final double width;
  final double padding;
  final Color? color;
  final Color? labelColor;
  final double borderRadius;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: heigth,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRadius)),
          primary: color ?? AppColors.primaryColor,
        ),
        child: Text(
          label,
          style: TextStyles.textButton,
        ),
      ),
    );
  }
}
