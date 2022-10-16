import 'dart:io';

import 'package:home_in_order/domain/models/request_service_model.dart';

abstract class IRequestServicesRepository {
  void requestPermission();
  void sendPushMessage(String title, String body, String token);
  Future<void> sendRequestService(
      String userId, RequestServiceModel requestServiceModel);
  Future<void> uploadListImages(String userId, List<File> files);
}
