import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_in_order/application/ui/utils/extensions/size_screen_extension.dart';
import 'package:home_in_order/domain/models/schedule_model.dart';
import 'package:home_in_order/modules/schedule/schedule/schedule_controller.dart';

class ScheduleCard extends GetView<ScheduleController> {
  const ScheduleCard({
    Key? key,
    required this.imageAvatar,
    required this.idContractor,
    required this.nameUser,
    required this.description,
    required this.hour,
    required this.documentId,
    required this.address,
    required this.scheduleModel,
  }) : super(key: key);

  final String imageAvatar;
  final String idContractor;
  final String nameUser;
  final String address;
  final String description;
  final String hour;
  final String documentId;
  final ScheduleModel scheduleModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 12.w),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                gradient: const LinearGradient(colors: [
                  Color(0xff5089FF),
                  Color(0xff246BFD),
                ]),
                border: Border.all(color: Colors.blue[700]!),
                borderRadius: BorderRadius.circular(8.r),
              ),
              height: 80,
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 22.w),
                child: Row(
                  /*  crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween, */
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          hour,
                          style: TextStyle(
                              fontSize: 22.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 12.w,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          description,
                          style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: Colors.white),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Row(
                          children: [
                            Text(
                              'Contratante: ',
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            Text(
                              nameUser,
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.place,
                              size: 16,
                              color: Colors.white,
                            ),
                            Text(
                              address,
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Container(
              width: 20,
              alignment: Alignment.topRight,
              child: InkWell(
                onTap: () => CoolAlert.show(
                  context: context,
                  type: CoolAlertType.confirm,
                  title: 'Confirmação',
                  text: 'Você tem certeza que deseja deletar este agendamento?',
                  confirmBtnText: 'Sim',
                  cancelBtnText: 'Não',
                  onCancelBtnTap: () => Get.back(),
                  onConfirmBtnTap: () {
                    controller.deleteSchedule(documentId, scheduleModel);
                    controller.deleteScheduleContractor(
                        idContractor, documentId, scheduleModel);
                    Get.back();
                  },
                  confirmBtnColor: Colors.green,
                ),
                child: Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(
                        60.r,
                      ),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.close,
                        size: 15.sp,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
