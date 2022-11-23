import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_in_order/application/auth/auth_service.dart';
import 'package:home_in_order/domain/models/schedule_model.dart';
import 'package:home_in_order/domain/models/user_contractor_information_model.dart';
import 'package:home_in_order/domain/services/receive_services/receive_services.dart';
import 'package:home_in_order/domain/services/schedule/schedule_service.dart';
import 'package:intl/intl.dart';

class ScheduleCreateController extends GetxController {
  ScheduleCreateController({
    required IScheduleService scheduleService,
    required IReceiveServices receiveServices,
    required AuthService authService,
  })  : _scheduleService = scheduleService,
        _receiveServices = receiveServices,
        _authService = authService;

  final IScheduleService _scheduleService;
  final IReceiveServices _receiveServices;
  final AuthService _authService;

  @override
  void onInit() {
    final arguments = Get.arguments;
    scheduleUserName.value = arguments[0];
    userData.value = arguments[1];
    providerId.value = _authService.user!.uid;
    getProviderName();
    super.onInit();
  }

  final scheduleUserName = ''.obs;
  final dateTime = Rxn<DateTime?>();
  final timeOfDay = Rxn<TimeOfDay?>();
  final userData = Rxn<UserContractorInformationModel>();
  final providerId = ''.obs;
  final providerName = ''.obs;

  Future<void> getProviderName() async {
    final userInfo = await FirebaseFirestore.instance
        .collection("users")
        .doc(providerId.value)
        .collection('personal_information')
        .get();

    final userInformation = userInfo.docs.first;

    providerName.value =
        '${userInformation['name']} ${userInformation['last_name'][0]}.';
  }

  String dateFormat(DateTime date) {
    final dateFormat = DateFormat('dd/MM/yyyy');
    return dateFormat.format(date);
  }

  Future<void> createSchedule(ScheduleModel scheduleModel) async {
    await _scheduleService.createSchedule(providerId.value, scheduleModel);
  }

  Future<void> createScheduleContractor(
      String contractorId, ScheduleModel scheduleModel) async {
    await _scheduleService.createSchedule(contractorId, scheduleModel);
  }

  Future<void> sendRPushNotificationOnCreateSchedule(String token) async {
    _receiveServices.sendPushMessage(
      'Agendamento criado! 📅',
      'Um agendamento foi criado para você, para ver mais detalhes acesse sua agenda!',
      token,
    );
  }
}
