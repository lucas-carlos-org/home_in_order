import 'package:firebase_database/firebase_database.dart';
import 'package:home_in_order/application/ui/utils/helpers/firebase_message_helper.dart';
import 'package:home_in_order/data/repositories/chat/chat_repository.dart';
import 'package:home_in_order/domain/models/chat_message_model.dart';
import 'package:home_in_order/domain/models/room_model.dart';

class ChatRepositoryImpl implements IChatRepository {
  final FirebaseDatabase _database = FirebaseDatabase.instance;

  @override
  Future<void> createRoom(String senderId, String receiverId) async {
    await _getUserRoom(senderId, receiverId).then((value) {
      if (value?.roomId == null) {
        _database
            .ref()
            .update(FirebaseChatHelper.getMapCreateRoom(senderId, receiverId));
      }
    });
  }

  @override
  Future<List<RoomModel>> getUserRooms(String userId) async {
    final roomList = await _getUserRooms(userId);
    return roomList;
  }

  Future<RoomModel?> _getUserRoom(String providerId, String userId) async {
    List<RoomModel> rooms = [];
    RoomModel room = RoomModel();
    await _database.ref("rooms").get().then((value) async {
      if (value.value != null) {
        (value.value as Map<dynamic, dynamic>).forEach((key, value) {
          rooms.add(RoomModel(
            roomId: key,
            createAt: value['createdAt'],
            updateAt: value['updatedAt'],
            lasMessage: value['lastMessage'],
            users: List<String>.from(
                    (value['users'] as Map<dynamic, dynamic>).keys)
                .map((e) => e)
                .toList(),
          ));
        });
        final roomFinded = rooms.where((element) {
          return element.users?.contains(providerId) == true &&
              element.users?.contains(userId) == true;
        }).toList();
        if (roomFinded.isNotEmpty) {
          room = roomFinded[0];
        }
      }
    });
    return room;
  }

  Future<List<RoomModel>> _getUserRooms(String userId) async {
    List<RoomModel> rooms = [];
    await _database.ref("rooms").get().then((value) async {
      if (value.value != null) {
        (value.value as Map<dynamic, dynamic>).forEach((key, value) {
          rooms.add(RoomModel(
            roomId: key,
            createAt: value['createdAt'],
            updateAt: value['updatedAt'],
            lasMessage: value['lastMessage'],
            users: List<String>.from(
                    (value['users'] as Map<dynamic, dynamic>).keys)
                .map((e) => e)
                .toList(),
          ));
        });
        final roomFinded = rooms.where((element) {
          return element.users?.contains(userId) == true;
        }).toList();
        rooms = roomFinded;
      }
    });
    return rooms;
  }

  @override
  Future<int> getCountMessagesNotRead(
      String senderId, String receiverId) async {
    int count = 0;
    await _getUserRoom(senderId, receiverId).then((value) async {
      final res = await _database
          .ref('user_room_messages_read/$senderId/${value?.roomId}')
          .get();
      if (res.value != null) {
        count = (res.value as Map<dynamic, dynamic>).length;
      }
    });
    return count;
  }

  @override
  Future<void> sendMessage(
      String senderId, String receiverId, String message) async {
    await _getUserRoom(senderId, receiverId).then(
      (value) async {
        await _database.ref().update(FirebaseChatHelper.getMapCreateMessage(
              senderId,
              receiverId,
              value!.roomId!,
              message,
            ));
        await _database.ref("rooms/${value.roomId}").update(
              FirebaseChatHelper.getMapUpdateRoom(
                message,
                receiverId,
                senderId,
              ),
            );
      },
    );
  }

  @override
  Future<void> onChatMessageReceiver(String senderId, String receiverId,
      Function(ChatMessageModel p1) action) async {
    await _getUserRoom(senderId, receiverId).then(
      (value) {
        _database.ref('messages/${value!.roomId}').onChildAdded.listen((event) {
          final message = (event.snapshot.value as Map<dynamic, dynamic>);
          action.call(
            FirebaseChatHelper.setMessageChat(
                message['createdAt'], message['sender'], message['text']),
          );
        });
      },
    );
  }

  @override
  Future<void> readMessages(String senderId, String receiverId) async {
    await _getUserRoom(senderId, receiverId).then((value) async {
      await _database
          .ref("user_room_messages_read/$senderId/${value?.roomId}")
          .remove();
    });
  }
}
