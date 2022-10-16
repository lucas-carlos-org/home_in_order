abstract class IRequestService {
  void requestPermission();
  void sendPushMessage(String title, String body, String token);
 /*  Future<void> sendRequestService(
      String userId, RequestServiceModel requestServiceModel);
  Future<void> uploadListImages(String userId, List<File> files); */
}
