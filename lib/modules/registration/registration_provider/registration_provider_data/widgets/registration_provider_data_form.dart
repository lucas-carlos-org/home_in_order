import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:home_in_order/application/ui/utils/extensions/size_screen_extension.dart';
import 'package:home_in_order/application/ui/widgets/custom_dropdown_widget.dart';
import 'package:home_in_order/application/ui/widgets/custom_elevated_button.dart';
import 'package:home_in_order/application/ui/widgets/custom_text_form_field.dart';
import 'package:home_in_order/application/ui/widgets/info_widget.dart';
import 'package:home_in_order/domain/models/user_provider_information_model.dart';
import 'package:home_in_order/modules/registration/registration_provider/registration_provider_data/registration_provider_controller.dart';
import 'package:home_in_order/modules/registration/registration_provider/registration_provider_data/widgets/custom_textformfield_multiline.dart';

import 'package:validatorless/validatorless.dart';

class RegistrationForm extends GetView<RegistrationProviderController> {
  RegistrationForm({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final nameEC = ''.obs;
  final middleNameEC = ''.obs;
  final phoneEC = ''.obs;
  final cpfOrCnpjEC = ''.obs;
  final cpfEC = ''.obs;
  final cnpjEC = ''.obs;
  final atuationAreaEC = ''.obs;
  final descriptionServiceEC = ''.obs;
  final experienceEC = ''.obs;
  final cityEC = ''.obs;

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
            CustomTextFormField(
              onChanged: (value) {
                phoneEC.value = value;
              },
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
                          cpfEC.value = value;
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
                          cnpjEC.value = value;
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
            CustomDropdownWidget(
              items: const [
                {
                  "display": "Diarista",
                  "value": "Diarista",
                },
                {
                  "display": "Babá",
                  "value": "Babá",
                },
                {
                  "display": "Eletricista",
                  "value": "Eletricista",
                },
                {
                  "display": "Hidraulico",
                  "value": "Hidraulico",
                },
                {
                  "display": "Marido de Aluguel",
                  "value": "Marido de Aluguel",
                },
                {
                  "display": "Outro",
                  "value": "Outro",
                },
              ],
              hintText: 'Área de atuação',
              value: controller.atuationArea.value,
              onSaved: (value) {
                atuationAreaEC.value = value;
                controller.atuationArea.value = value;
              },
            ),
            Obx(() {
              return Visibility(
                visible: controller.atuationArea.value == 'Outro',
                child: Column(
                  children: [
                    SizedBox(
                      height: 16.h,
                    ),
                    CustomTextFormField(
                      onChanged: (value) {
                        atuationAreaEC.value = value;
                      },
                      label: 'Especifique a Área de atuação ',
                      validator: Validatorless.multiple([
                        Validatorless.required('Área de atuação obrigatório'),
                      ]),
                      keyboardType: TextInputType.text,
                    ),
                  ],
                ),
              );
            }),
            SizedBox(
              height: 16.h,
            ),
            CustomTextformfieldMultiline(
              onChanged: (value) {
                descriptionServiceEC.value = value;
              },
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
                  onChanged: (value) {
                    experienceEC.value = value;
                  },
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
              items: const [
                {
                  "display": "Torres",
                  "value": "Torres",
                },
                {
                  "display": "Capão da Canoa",
                  "value": "Capão da Canoa",
                },
                {
                  "display": "Arroio do Sal",
                  "value": "Arroio do Sal",
                },
              ],
              hintText: 'Cidade de atuação',
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
                onPressed: (nameEC.value.isEmpty ||
                        middleNameEC.value.isEmpty ||
                        phoneEC.value.isEmpty ||
                        atuationAreaEC.value.isEmpty ||
                        descriptionServiceEC.value.isEmpty ||
                        experienceEC.value.isEmpty ||
                        cityEC.value.isEmpty)
                    ? null
                    : () {
                        if (_formKey.currentState!.validate()) {
                          controller.setPersonalInformations(
                            UserProviderInformationModel(
                              name: nameEC.value.capitalizeFirst,
                              lastName: middleNameEC.value.capitalizeFirst,
                              phoneNumber: phoneEC.value,
                              cpfOrCnpj: cpfEC.value.isNotEmpty
                                  ? cpfOrCnpjEC.value = cpfEC.value
                                  : cpfOrCnpjEC.value = cnpjEC.value,
                              atuationArea: atuationAreaEC.value.capitalizeFirst,
                              serviceDescription: descriptionServiceEC.value,
                              experienceTime: experienceEC.value,
                              city: cityEC.value,
                            ),
                          );
                          Get.offNamed(
                            '/registration-provider-photo',
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
