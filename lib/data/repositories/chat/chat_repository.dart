import 'package:home_in_order/domain/models/chat_message_model.dart';
import 'package:home_in_order/domain/models/room_model.dart';

abstract class IChatRepository {
  Future<void> createRoom(String senderId, String receiverId);
  Future<List<RoomModel>> getUserRooms(String userId);
  Future<int> getCountMessagesNotRead(String senderId, String receiverId);
  Future<void> sendMessage(String senderId, String receiverId, String message);
  Future<void> onChatMessageReceiver(String senderId, String receiverId, Function(ChatMessageModel) action);
  Future<void> readMessages(String senderId, String receiverId);
}
