import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:home_in_order/application/auth/auth_service.dart';
import 'package:home_in_order/domain/models/file_model.dart';
import 'package:home_in_order/domain/models/provider_historic_model.dart';
import 'package:home_in_order/domain/models/user_auth_model.dart';
import 'package:home_in_order/domain/models/user_provider_information_model.dart';
import 'package:home_in_order/domain/services/chat/chat_service.dart';
import 'package:home_in_order/domain/services/receive_services/receive_services.dart';
import 'package:home_in_order/modules/menu/menu_provider/menu_provider_controller.dart';

class DetailsContractorController extends GetxController {
  DetailsContractorController(
      {required IReceiveServices receiveServices,
      required AuthService authService,
      required IChatService chatService,
      require})
      : _receiveServices = receiveServices,
        _authService = authService,
        _chatService = chatService;

  @override
  void onInit() {
    super.onInit();
    final data = Get.arguments;
    documentId = data[1];
    dataValues = data[0];
    getListFiles();
    getUserData();
  }

  final IReceiveServices _receiveServices;
  final AuthService _authService;
  final IChatService _chatService;
  String? documentId;
  dynamic dataValues;
  final listFiles = <FileModel>[].obs;
  final userModelInfo = Rxn<UserProviderInformationModel>();
  final userModel = Rxn<UserAuthModel>();
  final avatarImage = ''.obs;

  Future<void> getUserData() async {
    final user = _authService.user;

    if (user != null) {
      final docRef = await FirebaseFirestore.instance
          .collection("users/${user.uid}/personal_information/")
          .get();

      final userRef = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();

      final docData = docRef.docs[0];

      userModel.value =
          UserAuthModel(imageAvatar: userRef['image_avatar'].toString());

      userModelInfo.value = UserProviderInformationModel(
          name: '${docData['name']} ${docData['last_name'][0]}.');
    }
  }

  void getListFiles() {
    final files =
        List<Map<String, dynamic>>.from(dataValues['files'] as List<dynamic>);
    for (var i = 0; i < files.length; i++) {
      listFiles.add(FileModel(imagePath: files[i]['image_path']));
    }
  }

  Future<void> sendPushNotification(String token) async {
    _receiveServices.sendPushMessage(
      'Olha que legal! 😁',
      'A sua solicitação de serviço foi aceita, para mais detalhes acesse a aba de chats!',
      token,
    );
  }

  Future<void> sendRPushNotificationOnRefuseService(String token) async {
    _receiveServices.sendPushMessage(
      'Que pena! 🥺',
      'A sua solicitação de serviço não foi aceita!',
      token,
    );
  }

  Future<void> createChatRoom(String userId) async {
    final user = _authService.user;
    if (user != null) {
      await _chatService.createRoom(user.uid, userId);
    }
  }

  Future<void> moveDocumentToActive(String contractorId) async {
    final user = _authService.user;

    if (user != null) {
      await _receiveServices.moveDocumentToActive(
        user.uid,
        documentId!,
        contractorId,
        ProviderHistoricModel(
          imageAvatar: userModel.value!.imageAvatar!,
          name: userModelInfo.value!.name!,
        ),
      );
    }
  }

  Future<void> moveDocumentToHistoric(String contractorId) async {
    final user = _authService.user;

    if (user != null) {
      await _receiveServices.moveDocumentPendingToHistoric(
        user.uid,
        documentId!,
        contractorId,
        ProviderHistoricModel(
          imageAvatar: userModel.value!.imageAvatar!,
          name: userModelInfo.value!.name!,
        ),
      );
    }
  }

  void changePage(int index) {
    Future.delayed(const Duration(milliseconds: 500), () {
      Get.put(MenuProviderController()).changePage(index);
    });
  }

  void goToPage() {
    Get.back();
    Get.back();
    Get.back();
  }
}
