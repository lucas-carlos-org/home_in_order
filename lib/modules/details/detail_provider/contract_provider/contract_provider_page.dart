import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:home_in_order/application/ui/utils/extensions/size_screen_extension.dart';
import 'package:home_in_order/application/ui/widgets/card_photo_provider.dart';
import 'package:home_in_order/application/ui/widgets/custom_back_button.dart';
import 'package:home_in_order/application/ui/widgets/custom_elevated_button.dart';
import 'package:home_in_order/domain/models/user_auth_model.dart';
import 'package:home_in_order/domain/models/user_provider_information_model.dart';
import 'package:home_in_order/modules/registration/registration_provider/registration_provider_data/widgets/custom_textformfield_multiline.dart';
import './contract_provider_controller.dart';

class ContractProviderPage extends GetView<ContractProviderController> {
  const ContractProviderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final data = Get.arguments;

    final UserAuthModel userAuthModel = data[0];
    final UserProviderInformationModel userProviderModel = data[1];

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0.h,
        leading: const CustomBackButton(),
        automaticallyImplyLeading: false,
      ),
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: IntrinsicHeight(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  headerComponent(userAuthModel),
                  titleComponent(userProviderModel),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 22.w),
                    child: const CustomTextformfieldMultiline(
                      hasInfo: false,
                      hintText: 'Resumo do seu problema',
                    ),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 22.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Fotos do problema',
                          style: TextStyle(
                              fontSize: 17.sp, fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                        /*  Row(
                          children: const [
                            CardPhoto(),
                            CardPhoto(),
                            CardPhoto(),
                          ],
                        ) */
                      ],
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 22.w),
                    child: CustomElevatedButton(
                      label: 'Solicitar',
                      onPressed: () {
                        controller.sendPushNotification(userAuthModel.deviceToken!);
                        Get.back();
                        Get.back();
                      },
                    ),
                  ),
                  SizedBox(
                    height: 36.h,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Padding titleComponent(UserProviderInformationModel userProviderModel) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 22.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 16.h,
          ),
          Text(
            '${userProviderModel.name} ${userProviderModel.lastName![0]}.',
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 22.sp),
          ),
          SizedBox(
            height: 3.h,
          ),
          Text(
            '${userProviderModel.atuationArea}',
            style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14.sp),
          ),
          SizedBox(
            height: 16.h,
          ),
        ],
      ),
    );
  }

  Stack headerComponent(UserAuthModel userAuthModel) {
    return Stack(
      children: [
        Container(
          height: 250.h,
          width: double.infinity,
          color: Colors.transparent,
          child: Image(
            image: NetworkImage(userAuthModel.imageAvatar!),
            fit: BoxFit.cover,
          ),
        ),
        const CustomBackButton(),
      ],
    );
  }
}
