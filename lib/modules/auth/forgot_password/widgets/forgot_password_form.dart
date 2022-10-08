import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_in_order/application/ui/utils/extensions/size_screen_extension.dart';
import 'package:home_in_order/application/ui/widgets/custom_elevated_button.dart';
import 'package:home_in_order/application/ui/widgets/custom_text_form_field.dart';
import 'package:home_in_order/modules/auth/forgot_password/forgot_password_controller.dart';
import 'package:validatorless/validatorless.dart';

class ForgotPasswordForm extends GetView<ForgotPasswordController> {
  ForgotPasswordForm({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final _emailEC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 22.w),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            CustomTextFormField(
              label: 'E-mail',
              validator: Validatorless.multiple([
                Validatorless.email('Digite um e-mail valido!'),
                Validatorless.required('E-mail obrigatório'),
              ]),
              controller: _emailEC,
            ),
            SizedBox(
              height: 30.h,
            ),
            CustomElevatedButton(
              onPressed: () {
                  if (_formKey.currentState!.validate()) {
                  controller.forgotPassword(_emailEC.text);
                }
              },
              label: 'Enviar email',
            ),
            SizedBox(
              height: 27.h,
            ),
          ],
        ),
      ),
    );
  }
}
