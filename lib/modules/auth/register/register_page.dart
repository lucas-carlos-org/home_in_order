import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:home_in_order/application/ui/theme/text_styles.dart';
import 'package:home_in_order/application/ui/utils/extensions/size_screen_extension.dart';
import 'package:home_in_order/application/ui/widgets/custom_back_button.dart';
import 'package:home_in_order/application/ui/widgets/custom_title.dart';
import 'package:home_in_order/modules/auth/register/widgets/register_form.dart';
import 'register_controller.dart';

class RegisterPage extends GetView<RegisterController> {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomBackButton(),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 22.w),
                    child: const CustomTitle(
                      title: 'Registre-se para começar',
                      subTitle: 'Que bom que você esta conosco, para começar basta apenas fazer seu cadastro abaixo.',
                    ),
                  ),
                  RegisterForm(),
                  const Spacer(),
                  bottomLoginAccount(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget bottomLoginAccount() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 22.w),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Já tem uma conta? '),
              InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () => Get.back(),
                child: Text(
                  'Faça o login agora',
                  style: TextStyles.linkPrimaryColor,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 16.h,
          )
        ],
      ),
    );
  }
}
