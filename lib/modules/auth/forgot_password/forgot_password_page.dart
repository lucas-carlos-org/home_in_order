import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:home_in_order/application/ui/theme/text_styles.dart';
import 'package:home_in_order/application/ui/utils/extensions/size_screen_extension.dart';
import 'package:home_in_order/application/ui/widgets/custom_back_button.dart';
import 'package:home_in_order/application/ui/widgets/custom_title.dart';
import 'package:home_in_order/modules/auth/forgot_password/widgets/forgot_password_form.dart';
import 'forgot_password_controller.dart';

class ForgotPasswordPage extends GetView<ForgotPasswordController> {
  const ForgotPasswordPage({Key? key}) : super(key: key);

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
                      title: 'Esqueceu sua senha?',
                      subTitle:
                          'Não se preocupe, isso acontece. Insira o e-mail vinculado à sua conta para recupera-lá',
                    ),
                  ),
                  ForgotPasswordForm(),
                  const Spacer(),
                  bodyLoginAccount(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget bodyLoginAccount() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 22.w),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Lembrou da senha? '),
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
