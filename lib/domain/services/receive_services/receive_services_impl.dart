
import 'package:home_in_order/data/repositories/receive_services/receive_service_repository.dart';
import 'package:home_in_order/domain/services/receive_services/receive_services.dart';

class ReceiveServicesImpl implements IReceiveServices{
  ReceiveServicesImpl({
    required IReceiveServiceRepository receiveServiceRepository,
  }) : _receiveServiceRepository = receiveServiceRepository;

  final IReceiveServiceRepository _receiveServiceRepository;


  @override
  void requestPermission() => _receiveServiceRepository.requestPermission();

  @override
  void sendPushMessage(String title, String body, String token) => _receiveServiceRepository.sendPushMessage(title, body, token);
  
}