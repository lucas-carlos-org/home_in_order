import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:home_in_order/application/ui/utils/extensions/size_screen_extension.dart';
import 'package:home_in_order/application/ui/widgets/custom_title.dart';
import 'package:home_in_order/modules/registration/registration_provider/registration_provider_photo/widgets/registration_photo_form.dart';
import './registration_provider_photo_controller.dart';

class RegistrationProviderPhotoPage
    extends GetView<RegistrationProviderPhotoController> {
  const RegistrationProviderPhotoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        EdgeInsets.only(left: 22.w, right: 22.w, top: 16.h),
                    child: const CustomTitle(
                      title: 'Finalizando cadastro ',
                      subTitle:
                          'Agora é a hora de escolher sua melhor foto, e mostrar um pouco mais dos seu(s) serviços.',
                    ),
                  ),
                  const RegistrationPhotoForm()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
