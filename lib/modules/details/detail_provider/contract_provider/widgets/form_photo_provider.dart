import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_in_order/application/ui/utils/extensions/size_screen_extension.dart';
import 'package:home_in_order/application/ui/widgets/custom_elevated_button.dart';
import 'package:home_in_order/modules/details/detail_provider/contract_provider/contract_provider_controller.dart';
import 'package:home_in_order/modules/details/detail_provider/contract_provider/widgets/card_photo_contract_provider.dart';
import 'package:home_in_order/modules/registration/registration_provider/registration_provider_data/widgets/custom_textformfield_multiline.dart';

class FormPhotoProvider extends GetView<ContractProviderController> {
  FormPhotoProvider({
    Key? key,
  }) : super(key: key);

  final formKey = GlobalKey<FormState>();
  final description = ''.obs;

  @override
  Widget build(BuildContext context) {
    return Form(
        key: formKey,
        child: Obx(() {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 22.w),
                child: CustomTextformfieldMultiline(
                  onChanged: (val) {
                    description.value = val;
                  },
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
                      height: 8.h,
                    ),
                    Text(
                      '* As imagens não são obrigatórias mas será muito importante para o prestador saber o seu real problema!',
                      style: TextStyle(
                        fontSize: 10.sp,
                      ),
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CardPhotoContractProvider(
                    onPressed: () =>
                        controller.getProblemImages(controller.problemPhotoOne),
                    photoFile: controller.problemPhotoOne,
                  ),
                  CardPhotoContractProvider(
                    onPressed: () =>
                        controller.getProblemImages(controller.problemPhotoTwo),
                    photoFile: controller.problemPhotoTwo,
                  ),
                  CardPhotoContractProvider(
                    onPressed: () => controller
                        .getProblemImages(controller.problemPhotoThree),
                    photoFile: controller.problemPhotoThree,
                  ),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 22.w),
                child: CustomElevatedButton(
                  label: 'Solicitar',
                  onPressed: description.value.length > 15
                      ? () {
                          CoolAlert.show(
                            context: context,
                            type: CoolAlertType.confirm,
                            title: 'Confirmação!',
                            text:
                                'Voce quer fazer esta solicitação de serviço?',
                            confirmBtnText: 'Sim',
                            cancelBtnText: 'Não',
                            confirmBtnColor: Colors.green,
                            onConfirmBtnTap: () async {
                              controller.createNewRequestService(
                                controller.providerModel.value!.id,
                                description.value,
                              );
                              controller.sendPushNotification(
                                  controller.providerModel.value!.deviceToken);
                              controller.goToHome();
                              CoolAlert.show(
                                context: context,
                                type: CoolAlertType.success,
                                title: 'Sucesso!',
                                text:
                                    "Serviço solicitado com sucesso! Aguarde o prestador de serviço aceitar sua solicitação, mas não se preocupe você será notificado(a)!",
                              );
                            },
                          );
                        }
                      : null,
                ),
              ),
              SizedBox(
                height: 39.h,
              ),
            ],
          );
        }));
  }
}
