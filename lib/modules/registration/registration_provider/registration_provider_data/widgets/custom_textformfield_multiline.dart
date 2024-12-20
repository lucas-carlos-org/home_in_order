import 'package:flutter/material.dart';
import 'package:home_in_order/application/ui/theme/app_colors.dart';
import 'package:home_in_order/application/ui/theme/text_styles.dart';
import 'package:home_in_order/application/ui/utils/extensions/size_screen_extension.dart';
import 'package:home_in_order/application/ui/widgets/info_widget.dart';

class CustomTextformfieldMultiline extends StatelessWidget {
  const CustomTextformfieldMultiline(
      {Key? key,
      this.validator,
      this.onChanged,
      this.hintText,
      this.hasInfo = true,
      this.readOnly = false,
      this.infoMessage})
      : super(key: key);

  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final bool hasInfo;
  final String? hintText;
  final String? infoMessage;
  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        TextFormField(
          readOnly: readOnly,
          validator: validator,
          maxLines: 4,
          onChanged: onChanged,
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
              borderSide: const BorderSide(color: Color(0xffF7F8F9), width: 2),
            ),
            hintText: hintText ?? 'Descrição',
            hintStyle: TextStyles.titleMono2,
          ),
        ),
        hasInfo
            ? Positioned.fill(
                right: -10,
                top: -10,
                child: Align(
                  alignment: Alignment.topRight,
                  child: InfoWidget(
                      infoMessage: infoMessage ??
                          'ex: Especialista em serviços hidráulicos, com mais de 10 anos de experiência em manutenção e troca de encanamentos!'),
                ),
              )
            : const SizedBox.shrink()
      ],
    );
  }
}
