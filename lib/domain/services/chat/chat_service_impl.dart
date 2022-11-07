import 'package:home_in_order/data/repositories/chat/chat_repository.dart';
import 'package:home_in_order/domain/models/chat_message_model.dart';
import 'package:home_in_order/domain/models/room_model.dart';
import 'package:home_in_order/domain/services/chat/chat_service.dart';

class ChatServiceImpl implements IChatService {
  ChatServiceImpl({
    required IChatRepository chatRepository,
  }) : _chatRepository = chatRepository;

  final IChatRepository _chatRepository;

  @override
  Future<void> createRoom(String providerId, String userId) =>
      _chatRepository.createRoom(providerId, userId);

  @override
  Future<List<RoomModel>> getUserRooms(String userId) =>
      _chatRepository.getUserRooms(userId);

  @override
  Future<void> sendMessage(String providerId, String userId, String message) =>
      _chatRepository.sendMessage(providerId, userId, message);

  @override
  Future<void> onChatMessageReceiver(String senderId, String receiverId,
          Function(ChatMessageModel p1) action) =>
      _chatRepository.onChatMessageReceiver(
          senderId, receiverId, (p0) => action.call(p0));

  @override
  Future<int> getCountMessagesNotRead(String senderId, String receiverId) => _chatRepository.getCountMessagesNotRead(senderId, receiverId);

  @override
  Future<void> readMessages(String senderId, String receiverId) => _chatRepository.readMessages(senderId, receiverId);
}
