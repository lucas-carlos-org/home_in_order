import 'package:home_in_order/domain/models/request_service_model.dart';

abstract class IRequestService {
  void requestPermission();
  Future<void> sendRequestService(String curretUserId, String userId,
      RequestServiceModel requestServiceModel);
}
