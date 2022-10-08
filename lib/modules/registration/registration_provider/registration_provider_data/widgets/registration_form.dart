import 'dart:developer';

import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:home_in_order/application/ui/utils/extensions/size_screen_extension.dart';
import 'package:home_in_order/application/ui/widgets/custom_dropdown_widget.dart';
import 'package:home_in_order/application/ui/widgets/custom_elevated_button.dart';
import 'package:home_in_order/application/ui/widgets/custom_text_form_field.dart';
import 'package:home_in_order/application/ui/widgets/info_widget.dart';
import 'package:home_in_order/domain/models/user_personal_information_model.dart';
import 'package:home_in_order/modules/registration/registration_provider/registration_provider_data/registration_provider_controller.dart';
import 'package:home_in_order/modules/registration/registration_provider/registration_provider_data/widgets/custom_textformfield_multiline.dart';

import 'package:validatorless/validatorless.dart';

class RegistrationForm extends GetView<RegistrationProviderController> {
  RegistrationForm({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final nameEC = TextEditingController();
  final middleNameEC = TextEditingController();
  final phoneEC = TextEditingController();
  final cpfOrCnpjEC = TextEditingController();
  final cpfEC = TextEditingController();
  final cnpjEC = TextEditingController();
  final atuationAreaEC = TextEditingController();
  final descriptionServiceEC = TextEditingController();
  final experienceEC = TextEditingController();
  final cityEC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 22.w),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: CustomTextFormField(
                    controller: nameEC,
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
                    controller: middleNameEC,
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
            CustomTextFormField(
              controller: phoneEC,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                TelefoneInputFormatter(),
              ],
              label: 'Telefone celular',
              validator: Validatorless.multiple([
                Validatorless.required('Telefone obrigatório'),
                Validatorless.min(14, 'Telefone inválido'),
              ]),
              keyboardType: TextInputType.number,
            ),
            SizedBox(
              height: 16.h,
            ),
            Obx(() {
              return Row(
                children: [
                  Expanded(
                    child: CustomTextFormField(
                      onChanged: (value) {
                        if (value.isNotEmpty) {
                          cpfEC.text = value;
                          controller.hasCpf.value = true;
                          controller.hasCnpj.value = false;
                        } else {
                          controller.hasCpf.value = false;
                        }
                      },
                      enabled: controller.hasCnpj.value == true ? false : true,
                      label: 'CPF',
                      keyboardType: TextInputType.number,
                      inputFormatters: controller.hasCnpj.value == true
                          ? null
                          : [
                              FilteringTextInputFormatter.digitsOnly,
                              CpfInputFormatter(),
                            ],
                      validator: controller.hasCnpj.value == true
                          ? null
                          : Validatorless.multiple([
                              Validatorless.required('CPF obrigatório'),
                              Validatorless.cpf('CPF inválido')
                            ]),
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Expanded(
                    child: CustomTextFormField(
                      onChanged: (value) {
                        if (value.isNotEmpty) {
                          cnpjEC.text = value;
                          controller.hasCnpj.value = true;
                          controller.hasCpf.value = false;
                        } else {
                          controller.hasCnpj.value = false;
                        }
                      },
                      enabled: controller.hasCpf.value == true ? false : true,
                      label: 'CNPJ',
                      keyboardType: TextInputType.number,
                      inputFormatters: controller.hasCpf.value == true
                          ? null
                          : [
                              FilteringTextInputFormatter.digitsOnly,
                              CnpjInputFormatter(),
                            ],
                      validator: controller.hasCpf.value == true
                          ? null
                          : Validatorless.multiple([
                              Validatorless.required('CNPJ obrigatório'),
                              Validatorless.cnpj('CNPJ inválido')
                            ]),
                    ),
                  ),
                ],
              );
            }),
            SizedBox(
              height: 16.h,
            ),
            Stack(
              children: [
                CustomTextFormField(
                  controller: atuationAreaEC,
                  label: 'Área de atuação ',
                  validator: Validatorless.multiple([
                    Validatorless.required('Área de atuação obrigatório'),
                  ]),
                  keyboardType: TextInputType.text,
                ),
                Positioned.fill(
                  right: -10,
                  top: -10,
                  child: Align(
                    alignment: Alignment.topRight,
                    child: InfoWidget(
                        infoMessage:
                            'ex: Diarista, Eletricista, Encanador, Marido de aluguel...'),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 16.h,
            ),
            CustomTextformfieldMultiline(
              validator: Validatorless.multiple([
                Validatorless.required('Descrição obrigatório'),
                Validatorless.min(
                    40, 'Descrição muito pequena escreva mais alguns detalhes')
              ]),
            ),
            SizedBox(
              height: 16.h,
            ),
            Stack(
              children: [
                CustomTextFormField(
                  controller: experienceEC,
                  onChanged: (value) {},
                  label: 'Tempo de experiência',
                  validator: Validatorless.multiple([
                    Validatorless.required('Tempo obrigatório'),
                    Validatorless.max(2, 'Digite um tempo valido')
                  ]),
                  keyboardType: TextInputType.number,
                ),
                Positioned.fill(
                  right: -10,
                  top: -10,
                  child: Align(
                    alignment: Alignment.topRight,
                    child: InfoWidget(
                        infoMessage: 'Ex: 5 (5 anos de experiencia)'),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 16.h,
            ),
            CustomDropdownWidget(
              value: controller.city.value,
              onSaved: (value) {
                cityEC.text = value;
              },
            ),
            SizedBox(
              height: 16.h,
            ),
            CustomElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  controller.setPersonalInformations(
                    UserPersonalInformationModel(
                      name: nameEC.text.capitalizeFirst,
                      lastName: middleNameEC.text.capitalizeFirst,
                      phoneNumber: phoneEC.text,
                      cpfOrCnpj: cpfEC.text.isNotEmpty
                          ? cpfOrCnpjEC.text = cpfEC.text
                          : cpfOrCnpjEC.text = cnpjEC.text,
                      atuationArea: atuationAreaEC.text.capitalizeFirst,
                      serviceDescription: descriptionServiceEC.text,
                      expirenceTime: experienceEC.text,
                      city: cityEC.text,
                    ),
                  );
                  Get.offNamed(
                    '/registration-provider-photo',
                  );
                }
              },
              label: 'Continuar',
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
