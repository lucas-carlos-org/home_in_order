import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:home_in_order/application/ui/utils/extensions/size_screen_extension.dart';
import 'package:home_in_order/application/ui/widgets/custom_elevated_button.dart';
import 'package:home_in_order/application/ui/widgets/custom_text_form_field.dart';
import 'package:home_in_order/domain/models/schedule_model.dart';
import 'package:home_in_order/modules/schedule/schedule/schedule_controller.dart';
import 'package:intl/intl.dart' as intl;
import 'package:lottie/lottie.dart';
import 'package:uuid/uuid.dart';
import './schedule_create_controller.dart';

class ScheduleCreatePage extends GetView<ScheduleCreateController> {
  ScheduleCreatePage({Key? key}) : super(key: key);

  final descriptionEC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final dateFormat = intl.DateFormat('yyyy-MM-dd');
    final hourFormat = intl.DateFormat('HH:mm');

    onBackClick() async {
      final scheduleController = Get.find<ScheduleController>();
      scheduleController.getScheduleUser();
      Get.back();
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Padding(
            padding: EdgeInsets.fromLTRB(
              20.w,
              20.h,
              20.w,
              0.h,
            ),
            child: Column(
              children: [
                Lottie.asset('assets/images/schedule_icon.json'),
                Text(
                  'Novo agendamento',
                  style: TextStyle(
                    fontSize: 22.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextFormField(
                  label: controller.scheduleUserName.value,
                  enabled: false,
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextFormField(
                  label: 'Descrição',
                  controller: descriptionEC,
                ),
                const SizedBox(
                  height: 10,
                ),
                Obx(() {
                  return CustomTextFormField(
                    label: controller.dateTime.value != null
                        ? controller.dateFormat(controller.dateTime.value!)
                        : 'Data',
                    suffixIcon: IconButton(
                      onPressed: () async {
                        DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(
                            2101,
                          ),
                        );

                        controller.dateTime.value = pickedDate;
                      },
                      icon: const Icon(
                        Icons.calendar_today,
                      ),
                    ),
                  );
                }),
                const SizedBox(
                  height: 10,
                ),
                Obx(() {
                  return CustomTextFormField(
                    label: controller.timeOfDay.value != null
                        ? controller.timeOfDay.value!.format(context)
                        : 'Hora',
                    suffixIcon: IconButton(
                      onPressed: () async {
                        TimeOfDay? pickedHour = await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.now(),
                          builder: (BuildContext context, Widget? child) {
                            return Directionality(
                              textDirection: TextDirection.rtl,
                              child: child!,
                            );
                          },
                        );
                        controller.timeOfDay.value = pickedHour;
                      },
                      icon: const Icon(
                        Icons.access_time_filled_outlined,
                      ),
                    ),
                  );
                }),
                const SizedBox(
                  height: 10,
                ),
                Obx(
                  () {
                    return CustomElevatedButton(
                      label: 'Criar',
                      onPressed: controller.dateTime.value.toString().isEmpty ||
                              descriptionEC.text.isEmpty ||
                              controller.timeOfDay.value.toString().isEmpty
                          ? null
                          : () async {
                              final now = DateTime.now();
                              final hour = DateTime(
                                now.year,
                                now.month,
                                now.day,
                                controller.timeOfDay.value!.hour,
                                controller.timeOfDay.value!.minute,
                              );

                              controller.createSchedule(
                                ScheduleModel(
                                  documentId: const Uuid().v4(),
                                  idContractor: 'sadjiasjd',
                                  idProvider:
                                      controller.providerId.value.toString(),
                                  date: dateFormat.format(
                                    controller.dateTime.value!,
                                  ),
                                  userName: controller.scheduleUserName.value,
                                  description: descriptionEC.text,
                                  hour: hourFormat.format(
                                    hour,
                                  ),
                                ),
                              );
                              await onBackClick();
                            },
                    );
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
