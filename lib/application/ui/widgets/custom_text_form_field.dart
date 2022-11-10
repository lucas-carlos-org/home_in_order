// ignore_for_file: avoid_bool_literals_in_conditional_expressions, must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:home_in_order/application/ui/theme/app_colors.dart';
import 'package:home_in_order/application/ui/theme/text_styles.dart';
import 'package:home_in_order/application/ui/utils/extensions/size_screen_extension.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({
    this.label,
    this.controller,
    this.validator,
    this.obscureText = false,
    this.suffixIcon,
    this.prefixIcon,
    this.onChanged,
    this.value,
    this.inputFormatters,
    this.keyboardType,
    this.maxLength,
    this.minLines,
    this.maxLines,
    this.textInputAction,
    this.expands = false,
    this.enabled = true,
    this.onTap,
    this.readOnly = false,
    Key? key,
  })  : _obscureTextVN = ValueNotifier<bool>(obscureText),
        assert(
          obscureText == true ? suffixIcon == null : true,
          'ObscureText não pode ser adicionado junto com o suffixIcon',
        ),
        super(key: key);

  final String? label;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final FormFieldValidator<String>? validator;
  final bool obscureText;
  final IconButton? suffixIcon;
  final IconData? prefixIcon;
  final ValueNotifier<bool> _obscureTextVN;
  final String? value;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  int? maxLength;
  int? minLines;
  int? maxLines;
  bool expands;
  bool enabled;
  TextInputAction? textInputAction;
  final VoidCallback? onTap;
  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: _obscureTextVN,
      builder: (_, obscureTextValue, child) {
        return InkWell(
          onTap: onTap,
          child: TextFormField(
            keyboardType: keyboardType,
            inputFormatters: inputFormatters,
            readOnly: readOnly,
            enabled: enabled,
            onChanged: onChanged,
            controller: controller,
            initialValue: value,
            validator: validator,
            maxLength: maxLength,
            obscureText: obscureTextValue,
            decoration: InputDecoration(
              filled: true,
              fillColor: const Color(0xffF7F8F9),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide:
                    const BorderSide(color: AppColors.greyBorder, width: 2),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide:
                    const BorderSide(color: AppColors.greyBorder, width: 2),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide:
                    const BorderSide(color: AppColors.greyBorder, width: 2),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide:
                    const BorderSide(color: Color(0xffF7F8F9), width: 2),
              ),
              suffixIcon: obscureText
                  ? IconButton(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onPressed: () {
                        _obscureTextVN.value = !obscureTextValue;
                      },
                      icon: Icon(
                        obscureTextValue
                            ? Icons.visibility_rounded
                            : Icons.visibility_off_rounded,
                        color: AppColors.greyDark.withOpacity(0.3),
                      ),
                    )
                  : suffixIcon,
              hintText: label,
              hintStyle: enabled == false
                  ? TextStyle(color: Colors.grey[400])
                  : TextStyles.titleMono2,
            ),
          ),
        );
      },
    );
  }
}
