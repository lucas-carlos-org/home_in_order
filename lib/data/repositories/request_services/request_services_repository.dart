import 'dart:io';
import 'package:home_in_order/domain/models/file_model.dart';
import 'package:home_in_order/domain/models/request_service_model.dart';

abstract class IRequestServicesRepository {
  void requestPermission();
  Future<void> sendRequestService(String curretUserId, String userId,
      RequestServiceModel requestServiceModel);
  Future<void> uploadListImages(String userId, List<File> files);
  Future<List<FileModel>> uploadServiceListImages(
      String userId, List<FileModel> files);
}
