import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:home_in_order/application/auth/auth_service.dart';
import 'package:home_in_order/domain/models/schedule_model.dart';
import 'package:home_in_order/domain/services/schedule/schedule_service.dart';
import 'package:intl/intl.dart';

class ScheduleController extends GetxController {
  ScheduleController({
    required AuthService authService,
    required IScheduleService scheduleService,
  })  : _authService = authService,
        _iScheduleService = scheduleService;

  @override
  void onInit() {
    userId.value = _authService.user!.uid;
    getScheduleUser();
    super.onInit();
  }

  final AuthService _authService;
  final IScheduleService _iScheduleService;
  var scheduleModel = <ScheduleModel>[].obs;
  var scheduleModelByDate = <ScheduleModel>[];
  var dateTimeSelected = Rxn<String>();
  final isEmptySchedule = false.obs;
  final userId = ''.obs;

  void convertedDateSelected(DateTime date) {
    final inputFormat = DateFormat('dd/MM/yyyy');
    final formatedDate = inputFormat.format(date);
    dateTimeSelected(formatedDate);
  }

  Future<void> getScheduleUser() async {
    scheduleModel.clear();
    scheduleModelByDate.clear();
    final user = _authService.user;

    if (user != null) {
      userId.value = user.uid;
      final docRef = await FirebaseFirestore.instance
          .collection("users/${user.uid}/schedule/")
          .get();

      final docData = docRef.docs;

      for (var documents in docData) {
        final dateFormat = DateFormat('dd/MM/yyyy');
        final dateToDatetime = DateTime.parse(documents['date']);
        final date = dateFormat.format(dateToDatetime);

        final scheduleModelData = ScheduleModel(
            providerName: '',
            docId: documents['docId'],
            idContractor: documents['idContractor'],
            idProvider: user.uid,
            date: date,
            address: documents['address'],
            description: documents['description'],
            userName: documents['userName'],
            hour: documents['hour']);

        scheduleModel.add(scheduleModelData);
        scheduleModel.sort((a, b) {
          final dateA = a.date!.split('/').reversed.join('');
          final dateB = b.date!.split('/').reversed.join('');
          return DateTime.parse(dateB).compareTo(DateTime.parse(dateA));
        });

        scheduleModelByDate.add(scheduleModelData);
        scheduleModelByDate.sort((a, b) {
          final dateA = a.date!.split('/').reversed.join('');
          final dateB = b.date!.split('/').reversed.join('');
          return DateTime.parse(dateB).compareTo(DateTime.parse(dateA));
        });
      }

      filteredByDate(DateTime.now());
    }
  }

  Future<void> deleteSchedule(
      String documentId, ScheduleModel scheduleModel) async {
    await _iScheduleService.cancelSchedule(
        _authService.user!.uid, documentId, scheduleModel);
    getScheduleUser();
  }

  Future<void> deleteScheduleContractor(String contractorId, String documentId,
      ScheduleModel scheduleModel) async {
    await _iScheduleService.cancelSchedule(
        contractorId, documentId, scheduleModel);
    getScheduleUser();
  }

  void filteredByDate(DateTime date) {
    final inputFormat = DateFormat('dd/MM/yyyy');
    final formatedDate = inputFormat.format(date);

    if (formatedDate.isNotEmpty) {
      var newListWithDate = scheduleModelByDate.where((m) {
        return m.date!.contains(formatedDate);
      });

      scheduleModel.clear();
      scheduleModel.addAll(newListWithDate);
    } else {
      scheduleModel.clear();
      scheduleModel.addAll(scheduleModelByDate);
    }
  }

  Future<void> navigateToCreateSchedule() async {
    final result = await Get.toNamed('/schedule-create');
    if (result == 'saved') {
      getScheduleUser();
    }
  }
}
