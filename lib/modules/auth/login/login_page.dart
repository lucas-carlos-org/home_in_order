import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:home_in_order/application/ui/theme/text_styles.dart';
import 'package:home_in_order/application/ui/utils/extensions/size_screen_extension.dart';
import 'package:home_in_order/application/ui/widgets/custom_social_button.dart';
import 'package:home_in_order/modules/auth/login/widgets/login_divider.dart';
import 'package:home_in_order/modules/auth/login/widgets/login_form.dart';
import './login_controller.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: IntrinsicHeight(
              child: Column(
                children: [
                  bodyImageHeader(),
                  LoginForm(),
                  const LoginDivider(label: 'Ou '),
                  bodySocialButtons(),
                  const Spacer(),
                  bodyCreateAccount(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Container bodyImageHeader() {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.transparent,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(
            'assets/images/image_background.jpg',
          ),
        ),
      ),
      height: 300.h,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.white.withOpacity(0),
              Colors.white.withOpacity(1),
            ],
          ),
        ),
      ),
    );
  }

  Widget bodySocialButtons() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 22.w),
      child: Column(
        children: [
          CustomSocialButton(
            onPressed: () => controller.loginWithGoogle(),
            iconPath: 'assets/icons/google.svg',
            label: 'Login com o Google',
          ),
          SizedBox(
            height: 36.h,
          )
        ],
      ),
    );
  }

  Widget bodyCreateAccount() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 22.w),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Ainda não possui uma conta? '),
              InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () => Get.toNamed('/register'),
                child: Text(
                  'Registre-se agora.',
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
