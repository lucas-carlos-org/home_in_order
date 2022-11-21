import 'package:home_in_order/data/repositories/request_services/request_services_repository.dart';
import 'package:home_in_order/domain/models/request_service_model.dart';
import 'package:home_in_order/domain/services/request_services/request_service.dart';

class RequestServiceImpl implements IRequestService {
  RequestServiceImpl({
    required IRequestServicesRepository requestServicesRepository,
  }) : _requestServicesRepository = requestServicesRepository;

  final IRequestServicesRepository _requestServicesRepository;

  @override
  void requestPermission() => _requestServicesRepository.requestPermission();

  @override
  Future<void> sendRequestService(String curretUserId, String userId,
          RequestServiceModel requestServiceModel) =>
      _requestServicesRepository.sendRequestService(
          curretUserId, userId, requestServiceModel);
}
