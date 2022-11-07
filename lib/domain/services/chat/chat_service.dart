import 'package:home_in_order/domain/models/chat_message_model.dart';
import 'package:home_in_order/domain/models/room_model.dart';

abstract class IChatService {
  Future<void> createRoom(String providerId, String userId);
  Future<List<RoomModel>> getUserRooms(String userId);
  Future<void> sendMessage(String providerId, String userId, String message);
  Future<void> onChatMessageReceiver(String senderId, String receiverId, Function(ChatMessageModel) action);
  Future<int> getCountMessagesNotRead(String senderId, String receiverId);
  Future<void> readMessages(String senderId, String receiverId);

}
