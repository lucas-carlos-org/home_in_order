import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_in_order/application/ui/theme/text_styles.dart';
import 'package:home_in_order/application/ui/utils/extensions/size_screen_extension.dart';
import 'package:home_in_order/application/ui/widgets/custom_elevated_button.dart';
import 'package:home_in_order/application/ui/widgets/custom_text_form_field.dart';
import 'package:home_in_order/modules/auth/login/login_controller.dart';
import 'package:validatorless/validatorless.dart';

class LoginForm extends GetView<LoginController> {
  LoginForm({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final _emailEC = TextEditingController();
  final _passwordEC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 22.w),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            SizedBox(
              height: 8.h,
            ),
            CustomTextFormField(
              label: 'E-mail',
              validator: Validatorless.multiple([
                Validatorless.email('Digite um e-mail valido!'),
                Validatorless.required('E-mail obrigatório'),
              ]),
              controller: _emailEC,
            ),
            SizedBox(
              height: 16.h,
            ),
            CustomTextFormField(
              label: 'Senha',
              obscureText: true,
              validator: Validatorless.required('Senha obrigatória!'),
              controller: _passwordEC,
            ),
            SizedBox(
              height: 8.h,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () => Get.toNamed('/forgot-password'),
                child: Text(
                  'Esqueceu sua senha? ',
                  style: TextStyles.linkPrimaryColor14,
                ),
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            CustomElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {}
              },
              label: 'Entrar',
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
