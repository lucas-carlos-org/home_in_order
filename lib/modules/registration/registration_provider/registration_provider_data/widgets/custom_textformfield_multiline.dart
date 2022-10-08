import 'package:flutter/material.dart';
import 'package:home_in_order/application/ui/theme/app_colors.dart';
import 'package:home_in_order/application/ui/theme/text_styles.dart';
import 'package:home_in_order/application/ui/utils/extensions/size_screen_extension.dart';
import 'package:home_in_order/application/ui/widgets/info_widget.dart';

class CustomTextformfieldMultiline extends StatelessWidget {
  final String? Function(String?)? validator;
  const CustomTextformfieldMultiline({Key? key, this.validator}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        TextFormField(
          validator: validator,
          maxLines: 4,
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
            hintText: 'Descrição',
            hintStyle: TextStyles.titleMono2,
          ),
        ),
        Positioned.fill(
          right: -10,
          top: -10,
          child: Align(
            alignment: Alignment.topRight,
            child: InfoWidget(
                infoMessage:
                    'ex: Especialista em serviços hidráulicos, com mais de 10 anos de experiência em manutenção e troca de encanamentos!'),
          ),
        ),
      ],
    );
  }
}
