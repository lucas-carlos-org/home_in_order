import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_in_order/application/ui/utils/extensions/size_screen_extension.dart';
import 'package:home_in_order/application/ui/widgets/custom_elevated_button.dart';
import 'package:home_in_order/modules/details/detail_provider/contract_provider/contract_provider_controller.dart';
import 'package:home_in_order/modules/details/detail_provider/contract_provider/widgets/card_photo_contract_provider.dart';

class FormPhotoProvider extends GetView<ContractProviderController> {
  const FormPhotoProvider({
    Key? key,
    required this.descriptionEC,
    required this.titleDescriptionEC,
  }) : super(key: key);

  final TextEditingController descriptionEC;
  final TextEditingController titleDescriptionEC;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
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
              onPressed: () =>
                  controller.getProblemImages(controller.problemPhotoThree),
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
            onPressed: () {
              CoolAlert.show(
                context: context,
                type: CoolAlertType.confirm,
                title: 'Confirmação!',
                text: 'Voce quer fazer esta solicitação de serviço?',
                confirmBtnText: 'Sim',
                cancelBtnText: 'Não',
                confirmBtnColor: Colors.green,
                onConfirmBtnTap: () async {
                  controller.createNewRequestService(
                      controller.providerModel.value!.id,
                      descriptionEC.text,
                      titleDescriptionEC.text);
                  controller.sendPushNotification(
                      controller.providerModel.value!.deviceToken);
                  controller.goToHome();
                  CoolAlert.show(
                    context: context,
                    type: CoolAlertType.success,
                    title: 'Sucesso!',
                    text:
                        "Serviço solicitado com sucesso! Aguarde o prestador de serviço aceitar sua solicitação, mas nao se precupe você sera notificado(a)! ",
                  );
                },
              );
            },
          ),
        ),
        SizedBox(
          height: 39.h,
        ),
      ],
    );
  }
}
