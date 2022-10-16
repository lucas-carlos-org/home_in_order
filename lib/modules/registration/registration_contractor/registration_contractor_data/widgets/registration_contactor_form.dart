import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_in_order/application/ui/utils/extensions/size_screen_extension.dart';
import 'package:home_in_order/application/ui/widgets/custom_dropdown_widget.dart';
import 'package:home_in_order/application/ui/widgets/custom_elevated_button.dart';
import 'package:home_in_order/application/ui/widgets/custom_text_form_field.dart';
import 'package:home_in_order/application/ui/widgets/succes_page.dart';
import 'package:home_in_order/domain/models/user_contractor_information_model.dart';
import 'package:home_in_order/modules/registration/registration_contractor/registration_contractor_data/registration_contractor_data_controller.dart';
import 'package:home_in_order/modules/registration/registration_contractor/registration_contractor_data/widgets/profile_photo_widget.dart';
import 'package:validatorless/validatorless.dart';

class RegistrationContactorForm
    extends GetView<RegistrationContractorDataController> {
  RegistrationContactorForm({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final nameEC = ''.obs;
  final middleNameEC = ''.obs;
  final adressEC = ''.obs;
  final numberEC = ''.obs;
  final cityEC = ''.obs;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 22.w),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Text(
              'Foto de perfil',
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 16.h,
            ),
            const ProfilePhotoContractorWidget(),
            SizedBox(
              height: 16.h,
            ),
            Row(
              children: [
                Expanded(
                  child: CustomTextFormField(
                    onChanged: (value) {
                      nameEC.value = value;
                    },
                    label: 'Nome',
                    validator: Validatorless.multiple([
                      Validatorless.required('Nome obrigatório'),
                    ]),
                    keyboardType: TextInputType.text,
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                Expanded(
                  child: CustomTextFormField(
                    onChanged: (value) {
                      middleNameEC.value = value;
                    },
                    label: 'Sobrenome',
                    validator: Validatorless.multiple([
                      Validatorless.required('Sobrenome obrigatório'),
                    ]),
                    keyboardType: TextInputType.text,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 16.h,
            ),
            Row(
              children: [
                Expanded(
                  child: CustomTextFormField(
                    onChanged: (value) {
                      adressEC.value = value;
                    },
                    label: 'Endereço',
                    validator: Validatorless.multiple([
                      Validatorless.required('Endereço obrigatório'),
                    ]),
                    keyboardType: TextInputType.text,
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                SizedBox(
                  width: 90.w,
                  child: CustomTextFormField(
                    onChanged: (value) {
                      numberEC.value = value;
                    },
                    label: 'Numero',
                    validator: Validatorless.multiple([
                      Validatorless.required('Obrigatório'),
                    ]),
                    keyboardType: TextInputType.text,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 16.h,
            ),
            CustomDropdownWidget(
              hintText: 'Cidade',
              value: controller.city.value,
              onSaved: (value) {
                cityEC.value = value;
              },
            ),
            SizedBox(
              height: 16.h,
            ),
            Obx(() {
              return CustomElevatedButton(
                onPressed: (controller.profilePhoto.value.isEmpty ||
                        nameEC.value.isEmpty ||
                        middleNameEC.value.isEmpty ||
                        adressEC.value.isEmpty ||
                        numberEC.value.isEmpty ||
                        cityEC.value.isEmpty)
                    ? null
                    : () {
                        controller.uploadImages();
                        if (_formKey.currentState!.validate()) {
                          controller.setPersonalInformations(
                              UserContractorInformationModel(
                            name: nameEC.value.capitalizeFirst,
                            lastName: middleNameEC.value.capitalizeFirst,
                            adress: adressEC.value,
                            number: numberEC.value,
                            city: cityEC.value,
                          ));

                          Get.offAll(
                            const SuccesPage(
                              userType: 'contractor',
                              label:
                                  'Você finalizou a etapa de cadastro, aguarde enquanto preparamos tudo para você!',
                            ),
                          );
                        }
                      },
                label: 'Continuar',
              );
            }),
            SizedBox(
              height: 27.h,
            ),
          ],
        ),
      ),
    );
  }
}
