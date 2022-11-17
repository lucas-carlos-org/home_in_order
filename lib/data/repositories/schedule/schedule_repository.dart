import 'package:home_in_order/domain/models/schedule_model.dart';

abstract class IScheduleRepository {
  Future<void> createSchedule(String userId, ScheduleModel scheduleModel);
  Future<void> cancelSchedule(String userId, String documentId, ScheduleModel scheduleModel);
}