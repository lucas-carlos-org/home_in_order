import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_in_order/application/ui/utils/extensions/size_screen_extension.dart';
import 'package:home_in_order/modules/home/home_provider/home_provider_initial/home_provider_initial_controller.dart';

class ButtonSchedule extends GetView<HomeProviderInitialController> {
  const ButtonSchedule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.changePage(1);
      },
      child: Container(
        height: 103.h,
        width: double.infinity,
        decoration: BoxDecoration(
          color: const Color(0xff1976D2),
          borderRadius: BorderRadius.circular(10.r),
        ),
        alignment: Alignment.centerRight,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 26.w),
              child: Text(
                'Consultar Agenda',
                style: TextStyle(
                    fontSize: 22.sp,
                    fontWeight: FontWeight.w700,
                    color: Colors.white),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Container(
                height: double.infinity,
                width: 80.w,
                decoration: BoxDecoration(
                  color: const Color(0xffC0E0FF),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(70.r),
                    bottomRight: Radius.circular(10.r),
                    topRight: Radius.circular(10.r),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
