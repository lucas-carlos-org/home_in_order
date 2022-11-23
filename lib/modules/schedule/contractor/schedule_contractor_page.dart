import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:home_in_order/application/ui/utils/extensions/size_screen_extension.dart';
import 'package:home_in_order/modules/schedule/contractor/schedule_contractor_controller.dart';
import 'package:home_in_order/modules/schedule/contractor/widget/contractor_schedule_card.dart';

class ScheduleContractorPage extends GetView<ScheduleContractorController> {
  const ScheduleContractorPage({Key? key}) : super(key: key);

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
            Obx(
              () {
                return Expanded(
                  child: StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection('users')
                        .doc(controller.userId.value)
                        .collection('schedule')
                        .orderBy('date')
                        .snapshots(),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.hasError) {
                        return const Center(
                            child: Text('Erro ao buscar dados!'));
                      }

                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CupertinoActivityIndicator(
                            animating: true,
                          ),
                        );
                      }

                      if (snapshot.data!.docs.isEmpty) {
                        return const Center(
                          child: Text(
                            'Nenhum agendamento encontrado!',
                          ),
                        );
                      }

                      return ListView(
                        children: snapshot.data!.docs
                            .map((DocumentSnapshot document) {
                          final data = document.data()! as Map<String, dynamic>;
                          final dateToDatetime = DateTime.parse(data['date']);
                          return ContractorScheduleCard(
                            date: dateToDatetime,
                            description: data['description'],
                            hour: data['hour'],
                            providerName: data['providerName'],
                          );
                        }).toList(),
                      );
                    },
                  ),
                );
              },
            )
          ],
        ),
      ),
      floatingActionButton: Visibility(
        visible: false,
        child: FloatingActionButton(
          onPressed: () {
            /* controller.navigateToCreateSchedule(); */
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
            'Aqui você encontra o agendamento dos seus serviços solicitados, resaltando que apenas o prestador de serviço pode deletar ou criar um agendamento para você!',
            textAlign: TextAlign.justify,
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
