abstract class IReceiveServiceRepository {
  void requestPermission();
  void sendPushMessage(String title, String body, String token);
}
