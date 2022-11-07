import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:home_in_order/application/ui/utils/extensions/size_screen_extension.dart';
import 'package:home_in_order/application/ui/widgets/custom_elevated_button.dart';
import 'package:home_in_order/application/ui/widgets/custom_text_form_field.dart';
import 'package:home_in_order/modules/registration/registration_provider/registration_provider_data/widgets/custom_textformfield_multiline.dart';
import 'package:validatorless/validatorless.dart';
import './profile_data_controller.dart';

class ProfileDataPage extends GetView<ProfileDataController> {
  const ProfileDataPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dados'),
      ),
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: IntrinsicHeight(
              child: Obx(
                () {
                  return controller.userType.value == 'provider'
                      ? controller.providerModel.value == null
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : Padding(
                              padding: EdgeInsets.symmetric(horizontal: 22.w),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: CustomTextFormField(
                                          value: controller
                                              .providerModel.value!.name!,
                                          validator: Validatorless.multiple([
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
                                          value: controller
                                              .providerModel.value!.lastName!,
                                          validator: Validatorless.multiple([
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
                                    value: controller
                                        .providerModel.value!.phoneNumber!,
                                  ),
                                  SizedBox(
                                    height: 16.h,
                                  ),
                                  CustomTextFormField(
                                    value: controller
                                        .providerModel.value!.cpfOrCnpj!,
                                  ),
                                  SizedBox(
                                    height: 16.h,
                                  ),
                                  CustomTextFormField(
                                    value: controller
                                        .providerModel.value!.atuationArea!,
                                  ),
                                  SizedBox(
                                    height: 16.h,
                                  ),
                                  CustomTextformfieldMultiline(
                                    hasInfo: false,
                                    hintText: controller.providerModel.value!
                                        .serviceDescription!,
                                  ),
                                  SizedBox(
                                    height: 16.h,
                                  ),
                                  CustomTextFormField(
                                    value: controller
                                        .providerModel.value!.experienceTime!,
                                  ),
                                  SizedBox(
                                    height: 16.h,
                                  ),
                                  CustomTextFormField(
                                    value:
                                        controller.providerModel.value!.city!,
                                  ),
                                  const Spacer(),
                                  CustomElevatedButton(
                                    label: 'Salvar',
                                    onPressed: () {},
                                  ),
                                  SizedBox(
                                    height: 39.h,
                                  ),
                                ],
                              ),
                            )
                      : controller.contractorModel.value == null
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : Padding(
                              padding: EdgeInsets.symmetric(horizontal: 22.w),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: CustomTextFormField(
                                          value: controller
                                              .contractorModel.value!.name!,
                                          validator: Validatorless.multiple([
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
                                          value: controller
                                              .contractorModel.value!.lastName!,
                                          validator: Validatorless.multiple([
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
                                    value: controller
                                        .contractorModel.value!.adress!,
                                  ),
                                  SizedBox(
                                    height: 16.h,
                                  ),
                                  CustomTextFormField(
                                    value: controller
                                        .contractorModel.value!.number!,
                                  ),
                                  SizedBox(
                                    height: 16.h,
                                  ),
                                  CustomTextFormField(
                                    value:
                                        controller.contractorModel.value!.city!,
                                  ),
                                  const Spacer(),
                                  CustomElevatedButton(
                                    label: 'Salvar',
                                    onPressed: () {},
                                  ),
                                  SizedBox(
                                    height: 39.h,
                                  ),
                                ],
                              ),
                            );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
