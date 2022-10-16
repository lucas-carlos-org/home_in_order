abstract class IReceiveServices {
  void requestPermission();
  void sendPushMessage(String title, String body, String token);
}
