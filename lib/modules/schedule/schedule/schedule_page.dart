import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:home_in_order/application/ui/utils/extensions/size_screen_extension.dart';
import 'package:home_in_order/domain/models/schedule_model.dart';
import 'package:home_in_order/modules/schedule/schedule/widgets/schedule_card.dart';
import 'schedule_controller.dart';

class SchedulePage extends GetView<ScheduleController> {
  const SchedulePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0.h,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 22.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            headerTitle(),
            SizedBox(
              height: 16.h,
            ),
            Column(
              children: [
                CalendarTimeline(
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate:
                      DateTime(DateTime.now().year, DateTime.now().month + 6),
                  onDateSelected: (date) {
                    controller.filteredByDate(date);
                  },
                  leftMargin: 20,
                  monthColor: Colors.blueGrey,
                  dayColor: Colors.black38,
                  activeDayColor: Colors.white,
                  activeBackgroundDayColor: const Color(0xff1976D2),
                  dotsColor: const Color(0xff1976D2),
                  locale: 'pt_BR',
                )
              ],
            ),
            Obx(() {
              return Expanded(
                child: controller.scheduleModel.isEmpty
                    ? const Center(
                        child: Text(
                          'Nenhum agendamento encontrado!',
                        ),
                      )
                    : ListView.builder(
                        itemCount: controller.scheduleModel.length,
                        itemBuilder: (context, index) {
                          final scheduleData = controller.scheduleModel[index];
                          return ScheduleCard(
                            scheduleModel: ScheduleModel(
                              docId: scheduleData.docId,
                              idContractor: scheduleData.idContractor,
                              idProvider: scheduleData.idProvider,
                              userName: scheduleData.userName,
                              description: scheduleData.description,
                              hour: scheduleData.hour,
                              address: scheduleData.address,
                            ),
                            idContractor: scheduleData.idContractor,
                            address: scheduleData.address,
                            imageAvatar: '',
                            nameUser: scheduleData.userName,
                            description: scheduleData.description,
                            hour: scheduleData.hour.toString(),
                            documentId: scheduleData.docId,
                          );
                        },
                      ),
              );
            })
          ],
        ),
      ),
      floatingActionButton: Visibility(
        visible: false,
        child: FloatingActionButton(
          onPressed: () {
            controller.navigateToCreateSchedule();
          },
          child: const Icon(Icons.event_note),
        ),
      ),
    );
  }

  Padding headerTitle() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 22.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Agenda',
            style: TextStyle(
              fontSize: 22.sp,
              fontWeight: FontWeight.w600,
              color: const Color(0xff1976D2),
            ),
          ),
          SizedBox(
            height: 8.h,
          ),
          Text(
            'Esta aba é onde se encontra seus agendamentos, para adicionar um novo somente é possivel atraves do chat com o usuario!',
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
