import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_in_order/application/ui/utils/extensions/size_screen_extension.dart';
import 'package:home_in_order/modules/schedule/schedule/schedule_controller.dart';

class ScheduleCard extends GetView<ScheduleController> {
  const ScheduleCard({
    Key? key,
    required this.imageAvatar,
    required this.nameUser,
    required this.description,
    required this.hour,
    required this.documentId,
    required this.address,
  }) : super(key: key);

  final String imageAvatar;
  final String nameUser;
  final String address;
  final String description;
  final String hour;
  final String documentId;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 12.w),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: double.infinity,
              height: 90.h,
              decoration: BoxDecoration(
                color: Colors.greenAccent.withOpacity(0.2),
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              nameUser,
                              style: TextStyle(
                                  fontSize: 16.sp, fontWeight: FontWeight.w700),
                            ),
                            SizedBox(
                              width: 150.w,
                              child: Text(
                                description,
                                maxLines: 1,
                                style: TextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w400),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.place_outlined,
                                  size: 12.sp,
                                ),
                                SizedBox(
                                  width: 5.w,
                                ),
                                Text(
                                  address,
                                  style: TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.access_time,
                          size: 15.sp,
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Text(
                          hour,
                          style: TextStyle(
                              fontSize: 20.sp,
                              color: Colors.green,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned.fill(
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
                  controller.deleteSchedule(documentId);
                  Get.back();
                },
                confirmBtnColor: Colors.green,
              ),
              child: Align(
                alignment: Alignment.topRight,
                child: Container(
                  height: 20.h,
                  width: 20.w,
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
        ],
      ),
    );
  }
}
