import 'package:get/get.dart';
import 'package:home_in_order/domain/services/request_services/request_service.dart';

class ContractProviderController extends GetxController {
  ContractProviderController({
    required IRequestService requestService,
  })  : _requestService = requestService;

  final IRequestService _requestService;


  Future<void> sendPushNotification(String token) async {
    _requestService.sendPushMessage('Nova Solictação', 'Você recebeu uma nova solicitação de serviço!', token);
  }

}