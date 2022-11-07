import 'package:home_in_order/domain/models/chat_message_model.dart';
import 'package:uuid/uuid.dart';

class FirebaseChatHelper {
  static Map<String, Object?> getMapCreateRoom(
      String providerId, String userId) {
    final idRoom = const Uuid().v4();
    final users = {providerId: false, userId: false};
    return {
      'rooms/$idRoom': {
        'createdAt': DateTime.now().millisecondsSinceEpoch,
        'updatedAt': DateTime.now().millisecondsSinceEpoch,
        'lastMessage': null,
        'users': users,
      },
      'user_rooms/$userId/$idRoom': true,
      'user_rooms/$providerId/$idRoom': true,
    };
  }

  static Map<String, Object?> getMapCreateMessage(
      String providerId, String idUser, String roomId, String message) {
    final messageId = const Uuid().v4();
    return {
      'messages/$roomId/$messageId': {
        'createdAt': DateTime.now().millisecondsSinceEpoch,
        'sender': idUser,
        'text': message,
      },
      'user_room_messages_read/$providerId/$roomId/$messageId': false
    };
  }

  static Map<String, Object?> getMapUpdateRoom(
      String message, String userId, String providerId) {
    return {
      'lastMessage': message,
      'updatedAt': DateTime.now().millisecondsSinceEpoch,
      'users/$userId': true,
      'users/$providerId': true,
    };
  }

  static ChatMessageModel setMessageChat(
          int? createdAt, String? sender, String? text) =>
      ChatMessageModel(
        createdAt: createdAt,
        sender: sender,
        text: text,
      );
}
