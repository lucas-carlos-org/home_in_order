import 'package:home_in_order/data/repositories/schedule/schedule_repository.dart';
import 'package:home_in_order/domain/models/schedule_model.dart';
import 'package:home_in_order/domain/services/schedule/schedule_service.dart';

class ScheduleServiceImpl implements IScheduleService {
  ScheduleServiceImpl({
    required IScheduleRepository scheduleRepository,
  }) : _scheduleRepository = scheduleRepository;

  final IScheduleRepository _scheduleRepository;

  @override
  Future<void> createSchedule(String userId, ScheduleModel scheduleModel) =>
      _scheduleRepository.createSchedule(userId, scheduleModel);

  @override
  Future<void> cancelSchedule(
          String userId, String documentId, ScheduleModel scheduleModel) =>
      _scheduleRepository.cancelSchedule(userId, documentId, scheduleModel);
}
