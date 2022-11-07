import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:home_in_order/application/exceptions/failure.dart';
import 'package:home_in_order/data/repositories/schedule/schedule_repository.dart';
import 'package:home_in_order/domain/models/schedule_model.dart';

class ScheduleRepositoryImpl implements IScheduleRepository {
  @override
  Future<void> cancelSchedule(String userId, String documentId) async {
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .collection('schedule').doc(documentId).delete();
    } catch (e) {
      throw Failure(message: 'Error ao deletar agendamento!');
    }
  }

  @override
  Future<void> createSchedule(
      String userId, ScheduleModel scheduleModel) async {
    try {
      var collectionRef = FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .collection('schedule');

      final scheduleData = scheduleModel;
      Map<String, dynamic> scheduleToMap = scheduleData.toMap();

      await collectionRef.add(scheduleToMap);
    } catch (e) {
      throw Failure(message: 'Error ao criar agendamento!');
    }
  }
}