import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_in_order/application/ui/utils/extensions/size_screen_extension.dart';
import 'package:home_in_order/application/ui/widgets/custom_elevated_button.dart';
import 'package:home_in_order/application/ui/widgets/custom_text_form_field.dart';
import 'package:home_in_order/modules/auth/register/register_controller.dart';
import 'package:validatorless/validatorless.dart';

class RegisterForm extends GetView<RegisterController> {
  RegisterForm({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final _emailEC = TextEditingController();
  final _passwordEC = TextEditingController();
  final _confirmPasswordEC = TextEditingController();

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
              height: 16.h,
            ),
            CustomTextFormField(
              obscureText: true,
              label: 'Senha',
              validator: Validatorless.multiple([
                Validatorless.min(6, 'Senha deve ter pelo menos 6 caracteres'),
                Validatorless.required('Senha obrigatório'),
              ]),
              controller: _passwordEC,
            ),
            SizedBox(
              height: 16.h,
            ),
            CustomTextFormField(
              obscureText: true,
              label: 'Confirmar senha',
              validator: Validatorless.multiple([
                Validatorless.compare(
                    _passwordEC, 'Senha não coincide com a senha digita acima'),
                Validatorless.required('Confirma senha obrigatório'),
              ]),
              controller: _confirmPasswordEC,
            ),
            SizedBox(
              height: 30.h,
            ),
            CustomElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  controller.register(_emailEC.text, _passwordEC.text);
                }
              },
              label: 'Registrar-se',
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
