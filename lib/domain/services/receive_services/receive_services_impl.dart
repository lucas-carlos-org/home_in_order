import 'package:home_in_order/data/repositories/receive_services/receive_service_repository.dart';
import 'package:home_in_order/domain/models/provider_historic_model.dart';
import 'package:home_in_order/domain/services/receive_services/receive_services.dart';

class ReceiveServicesImpl implements IReceiveServices {
  ReceiveServicesImpl({
    required IReceiveServiceRepository receiveServiceRepository,
  }) : _receiveServiceRepository = receiveServiceRepository;

  final IReceiveServiceRepository _receiveServiceRepository;

  @override
  void requestPermission() => _receiveServiceRepository.requestPermission();

  @override
  void sendPushMessage(String title, String body, String token) =>
      _receiveServiceRepository.sendPushMessage(title, body, token);

  @override
  Future<void> moveDocumentToActive(String userId, String docId,
          String? contractorId, ProviderHistoricModel providerHistoricModel) =>
      _receiveServiceRepository.moveDocumentPendingToActive(
          userId, docId, contractorId, providerHistoricModel);

  @override
  Future<void> moveDocumentPendingToHistoric(String userId, String docId,
          String? contractorId, ProviderHistoricModel providerHistoricModel) =>
      _receiveServiceRepository.moveDocumentPendingToHistoric(
          userId, docId, contractorId, providerHistoricModel);

  @override
  Future<void> moveDocumentActiveToHistoric(String userId, String docId,
          String? contractorId, ProviderHistoricModel providerHistoricModel) =>
      _receiveServiceRepository.moveDocumentActiveToHistoric(
          userId, docId, contractorId, providerHistoricModel);
}
