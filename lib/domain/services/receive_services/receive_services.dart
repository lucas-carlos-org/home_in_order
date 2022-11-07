import 'package:home_in_order/domain/models/provider_historic_model.dart';

abstract class IReceiveServices {
  void requestPermission();
  void sendPushMessage(String title, String body, String token);
  Future<void> moveDocumentToActive(String userId, String docId,
      String? contractorId, ProviderHistoricModel providerHistoricModel);
  Future<void> moveDocumentPendingToHistoric(String userId, String docId,
      String? contractorId, ProviderHistoricModel providerHistoricModel);
  Future<void> moveDocumentActiveToHistoric(String userId, String docId,
      String? contractorId, ProviderHistoricModel providerHistoricModel);
}
