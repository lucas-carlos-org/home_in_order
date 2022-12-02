import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:home_in_order/application/ui/utils/extensions/size_screen_extension.dart';
import 'package:home_in_order/application/ui/widgets/custom_back_button.dart';
import 'package:home_in_order/application/ui/widgets/custom_text_form_field.dart';
import 'package:home_in_order/modules/registration/registration_provider/registration_provider_data/widgets/custom_textformfield_multiline.dart';
import 'package:validatorless/validatorless.dart';
import './profile_data_controller.dart';

class ProfileDataPage extends GetView<ProfileDataController> {
  const ProfileDataPage({Key? key}) : super(key: key);

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
                  Row(
                    children: [
                      const CustomBackButton(),
                      Text(
                        'Dados',
                        style: TextStyle(
                          fontSize: 22.sp,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xff1976D2),
                        ),
                      ),
                    ],
                  ),
                  Obx(
                    () {
                      return controller.userType.value == 'provider'
                          ? controller.providerModel.value == null
                              ? const Center(
                                  child: CupertinoActivityIndicator(
                                    animating: true,
                                  ),
                                )
                              : Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 22.w),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                            child: CustomTextFormField(
                                              readOnly: true,
                                              value: controller
                                                  .providerModel.value!.name!,
                                              validator:
                                                  Validatorless.multiple([
                                                Validatorless.required(
                                                    'Nome obrigatório'),
                                              ]),
                                              keyboardType: TextInputType.text,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10.w,
                                          ),
                                          Expanded(
                                            child: CustomTextFormField(
                                              readOnly: true,
                                              value: controller.providerModel
                                                  .value!.lastName!,
                                              validator:
                                                  Validatorless.multiple([
                                                Validatorless.required(
                                                    'Sobrenome obrigatório'),
                                              ]),
                                              keyboardType: TextInputType.text,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 16.h,
                                      ),
                                      CustomTextFormField(
                                        readOnly: true,
                                        value: controller
                                            .providerModel.value!.phoneNumber!,
                                      ),
                                      SizedBox(
                                        height: 16.h,
                                      ),
                                      CustomTextFormField(
                                        readOnly: true,
                                        value: controller
                                            .providerModel.value!.cpfOrCnpj!,
                                      ),
                                      SizedBox(
                                        height: 16.h,
                                      ),
                                      CustomTextFormField(
                                        readOnly: true,
                                        value: controller
                                            .providerModel.value!.atuationArea!,
                                      ),
                                      SizedBox(
                                        height: 16.h,
                                      ),
                                      CustomTextformfieldMultiline(
                                        readOnly: true,
                                        hasInfo: false,
                                        hintText: controller.providerModel
                                            .value!.serviceDescription!,
                                      ),
                                      SizedBox(
                                        height: 16.h,
                                      ),
                                      CustomTextFormField(
                                        readOnly: true,
                                        value: controller.providerModel.value!
                                            .experienceTime!,
                                      ),
                                      SizedBox(
                                        height: 16.h,
                                      ),
                                      CustomTextFormField(
                                        readOnly: true,
                                        value: controller
                                            .providerModel.value!.city!,
                                      ),
                                    ],
                                  ),
                                )
                          : controller.contractorModel.value == null
                              ? const Center(
                                  child: CupertinoActivityIndicator(
                                    animating: true,
                                  ),
                                )
                              : Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 22.w),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                            child: CustomTextFormField(
                                              readOnly: true,
                                              value: controller
                                                  .contractorModel.value!.name!,
                                              validator:
                                                  Validatorless.multiple([
                                                Validatorless.required(
                                                    'Nome obrigatório'),
                                              ]),
                                              keyboardType: TextInputType.text,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10.w,
                                          ),
                                          Expanded(
                                            child: CustomTextFormField(
                                              readOnly: true,
                                              value: controller.contractorModel
                                                  .value!.lastName!,
                                              validator:
                                                  Validatorless.multiple([
                                                Validatorless.required(
                                                    'Sobrenome obrigatório'),
                                              ]),
                                              keyboardType: TextInputType.text,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 16.h,
                                      ),
                                      CustomTextFormField(
                                        readOnly: true,
                                        value: controller
                                            .contractorModel.value!.adress!,
                                      ),
                                      SizedBox(
                                        height: 16.h,
                                      ),
                                      CustomTextFormField(
                                        readOnly: true,
                                        value: controller
                                            .contractorModel.value!.number!,
                                      ),
                                      SizedBox(
                                        height: 16.h,
                                      ),
                                      CustomTextFormField(
                                        readOnly: true,
                                        value: controller
                                            .contractorModel.value!.city!,
                                      ),
                                    ],
                                  ),
                                );
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
