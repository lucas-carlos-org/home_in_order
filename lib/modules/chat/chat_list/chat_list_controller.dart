import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:home_in_order/application/auth/auth_service.dart';
import 'package:home_in_order/domain/models/room_model.dart';
import 'package:home_in_order/domain/models/user_contractor_information_model.dart';
import 'package:home_in_order/domain/services/chat/chat_service.dart';

class ChatListController extends GetxController {
  ChatListController({
    required AuthService authService,
    required IChatService chatService,
    require,
  })  : _authService = authService,
        _chatService = chatService;

  @override
  void onInit() {
    rooms = RxList.empty();
    isLoading = false.obs;
    getUserRooms();
    super.onInit();
  }

  final AuthService _authService;
  final IChatService _chatService;
  late RxList<RoomModel> rooms;
  late RxBool isLoading;

  Future<void> getUserRooms() async {
    isLoading.value = true;
    final user = _authService.user;
    if (user != null) {
      await _chatService.getUserRooms(user.uid).then((values) async {
        for (var element in values) {
          final userInfo = await getUserInfo(
            element.users!.firstWhere(
              (element) {
                return element != user.uid;
              },
            ),
          );
          element.userInformation = userInfo;
          element.updateAt;
        }
        rooms(values);
      });
    }
    isLoading.value = false;
  }

  Future<UserContractorInformationModel> getUserInfo(String userId) async {
    final userInfo = await FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('personal_information')
        .get();

    final userData = userInfo.docs.first;

    final userRef =
        await FirebaseFirestore.instance.collection('users').doc(userId).get();

    return userRef['user_type'] == 'provider'
        ? UserContractorInformationModel(
            userType: userRef['user_type'],
            imageAvatar: userRef['image_avatar'],
            name: userData['name'],
            lastName: userData['last_name'],
            id: userId,
          )
        : UserContractorInformationModel(
            userType: userRef['user_type'],
            imageAvatar: userRef['image_avatar'],
            name: userData['name'],
            lastName: userData['last_name'],
            id: userId,
            adress: userData['adress'],
            city: userData['cidade'],
            number: userData['number'],
          );
  }

  Future<void> navigateToDetail(String userId, String name,
      UserContractorInformationModel userData) async {
    await Get.toNamed('/chat-detail', arguments: [userId, name, userData]);
    rooms.clear();
    await getUserRooms();
  }

  Future<void> onRefresh() async {
    rooms.clear();
    await getUserRooms();
  }
}
