import 'package:cached_network_image/cached_network_image.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:home_in_order/application/ui/utils/extensions/size_screen_extension.dart';
import 'package:home_in_order/application/ui/widgets/card_photo_provider.dart';
import 'package:home_in_order/application/ui/widgets/custom_back_button.dart';
import 'package:home_in_order/application/ui/widgets/custom_elevated_button.dart';
import 'package:home_in_order/modules/details/details_contractor/details_contractor_controller.dart';

class DetailsContractorPage extends GetView<DetailsContractorController> {
  const DetailsContractorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  headerPageComponent(controller.dataValues),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 22.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 36.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              controller.dataValues['name'],
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 22.sp,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 31.h,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.room_outlined,
                              size: 20.sp,
                              color: const Color(0xff1976D2),
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            Text(
                              'Endereço:',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 17.sp,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Row(
                          children: [
                            Text(
                              '${controller.dataValues['address']}, Nº',
                              style: TextStyle(
                                fontSize: 14.sp,
                              ),
                            ),
                            Text(
                              '${controller.dataValues['number']}, ',
                              style: TextStyle(
                                fontSize: 14.sp,
                              ),
                            ),
                            Text(
                              '${controller.dataValues['city']}/RS',
                              style: TextStyle(
                                fontSize: 14.sp,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 31.h,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.info_outline,
                              size: 20.sp,
                              color: const Color(0xff1976D2),
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            Text(
                              'Detalhes do problema',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 17.sp,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                        Text(
                          controller.dataValues['description'],
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 14.sp,
                              color: Colors.black54,
                              height: 1.5),
                        ),
                        SizedBox(
                          height: 34.h,
                        ),
                        Obx(
                          () {
                            return SizedBox(
                              height: 100.h,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: controller.listFiles.length,
                                itemBuilder: (context, index) {
                                  final imageFile = controller.listFiles[index];
                                  return CardPhoto(
                                    imagePath: imageFile.imagePath,
                                  );
                                },
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  const Spacer(),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 22.w),
                    child: CustomElevatedButton(
                      label: 'Começar Negociar',
                      onPressed: () {
                        controller.sendPushNotification(
                            controller.dataValues['deviceToken'].toString());
                        controller.moveDocumentToActive(
                            controller.dataValues['contractorId']);
                        controller.createChatRoom(controller.dataValues['id']);
                        Get.back();
                        controller.changePage();
                        CoolAlert.show(
                          context: context,
                          type: CoolAlertType.success,
                          title: 'Sucesso!',
                          text:
                              "Voce aceitou negociar com o cliente. Acesse o chat com o mesmo para discutir os detalhes!",
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 22.w),
                    child: CustomElevatedButton(
                      color: Colors.redAccent,
                      label: 'Recusar',
                      onPressed: () {
                        CoolAlert.show(
                          context: context,
                          type: CoolAlertType.confirm,
                          title: 'Confirmação',
                          text:
                              'Você tem certeza que deseja recusar esta solicitação de serviço?',
                          confirmBtnText: 'Sim',
                          cancelBtnText: 'Não',
                          onCancelBtnTap: () => Get.back(),
                          onConfirmBtnTap: () {
                            controller.sendRPushNotificationOnRefuseService(
                                controller.dataValues['deviceToken']
                                    .toString());
                            controller.moveDocumentToHistoric(
                                controller.dataValues['contractorId']);
                            controller.goToPage();
                          },
                          confirmBtnColor: Colors.green,
                        );
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

  Stack headerPageComponent(Map<String, dynamic> data) {
    return Stack(
      children: [
        Container(
          height: 250.h,
          width: double.infinity,
          color: Colors.transparent,
          child: Image(
            image: CachedNetworkImageProvider(
                data['imageAvatar'] ?? data['image_avatar']),
            fit: BoxFit.cover,
          ),
        ),
        Positioned.fill(
          bottom: -160.h,
          child: Center(
            child: Container(
              height: 42.h,
              width: 142.w,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.assignment_outlined,
                          size: 20.sp,
                          color: const Color(0xff1976D2),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Text(
                          'Solicitação',
                          style: TextStyle(
                            fontSize: 17.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        const CustomBackButton(),
      ],
    );
  }
}
