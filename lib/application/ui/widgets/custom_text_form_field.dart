// ignore_for_file: avoid_bool_literals_in_conditional_expressions
import 'package:flutter/material.dart';
import 'package:home_in_order/application/ui/theme/app_colors.dart';
import 'package:home_in_order/application/ui/theme/text_styles.dart';
import 'package:home_in_order/application/ui/utils/extensions/size_screen_extension.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({
    required this.label,
    this.controller,
    this.validator,
    this.obscureText = false,
    this.suffixIcon,
    this.prefixIcon,
    this.onChanged,
    this.value,
    Key? key,
  })  : _obscureTextVN = ValueNotifier<bool>(obscureText),
        assert(
          obscureText == true ? suffixIcon == null : true,
          'ObscureText não pode ser adicionado junto com o suffixIcon',
        ),
        super(key: key);

  final String label;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final FormFieldValidator<String>? validator;
  final bool obscureText;
  final IconButton? suffixIcon;
  final IconData? prefixIcon;
  final ValueNotifier<bool> _obscureTextVN;
  final String? value;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: _obscureTextVN,
      builder: (_, obscureTextValue, child) {
        return TextFormField(
          onChanged: onChanged,
          controller: controller,
          initialValue: value,
          validator: validator,
          obscureText: obscureTextValue,
          decoration: InputDecoration(
            filled: true,
            fillColor: const Color(0xffF7F8F9),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: const BorderSide(color: AppColors.greyBorder, width: 2),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: const BorderSide(color: AppColors.greyBorder, width: 2),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: const BorderSide(color: AppColors.greyBorder, width: 2),
            ),
            suffixIcon: obscureText
                ? IconButton(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onPressed: () {
                      _obscureTextVN.value = !obscureTextValue;
                    },
                    icon: Icon(
                      obscureTextValue ? Icons.visibility_rounded : Icons.visibility_off_rounded,
                      color: AppColors.greyDark.withOpacity(0.3),
                    ),
                  )
                : suffixIcon,
            hintText: label,
            hintStyle: TextStyles.titleMono2,
          ),
        );
      },
    );
  }
}
