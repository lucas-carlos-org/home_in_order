import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_in_order/application/auth/auth_service.dart';
import 'package:home_in_order/domain/models/schedule_model.dart';
import 'package:home_in_order/domain/models/user_contractor_information_model.dart';
import 'package:home_in_order/domain/services/request_services/request_service.dart';
import 'package:home_in_order/domain/services/schedule/schedule_service.dart';
import 'package:intl/intl.dart';

class ScheduleCreateController extends GetxController {
  ScheduleCreateController({
    required IScheduleService scheduleService,
    required IRequestService requestServices,
    required AuthService authService,
  })  : _scheduleService = scheduleService,
  _requestServices = requestServices,
        _authService = authService;

  final IScheduleService _scheduleService;
  final IRequestService _requestServices;
  final AuthService _authService;

  @override
  void onInit() {
    final arguments = Get.arguments;
    scheduleUserName.value = arguments[0];
    userData.value = arguments[1];
    providerId.value = _authService.user!.uid;
    super.onInit();
  }

  final scheduleUserName = ''.obs;
  final dateTime = Rxn<DateTime?>();
  final timeOfDay = Rxn<TimeOfDay?>();
  final userData = Rxn<UserContractorInformationModel>();
  final providerId = ''.obs;

  String dateFormat(DateTime date) {
    final dateFormat = DateFormat('dd/MM/yyyy');
    return dateFormat.format(date);
  }

  Future<void> createSchedule(ScheduleModel scheduleModel) async {
    await _scheduleService.createSchedule(providerId.value, scheduleModel);
  }

  Future<void> createScheduleContractor(String contractorId, ScheduleModel scheduleModel) async {
    await _scheduleService.createSchedule(contractorId, scheduleModel);
  }

  Future<void> sendRPushNotificationOnCreateSchedule(String token) async {
    _requestServices.sendPushMessage(
      'Confira sua agenda! 📅',
      'Um agendamento foi criado para você, para ver mais detalhes acesse sua agenda!',
      token,
    );
  }
}
