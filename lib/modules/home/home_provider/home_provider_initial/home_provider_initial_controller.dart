import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:home_in_order/application/auth/auth_service.dart';
import 'package:home_in_order/domain/models/provider_historic_model.dart';
import 'package:home_in_order/domain/models/user_auth_model.dart';
import 'package:home_in_order/domain/models/user_provider_information_model.dart';
import 'package:home_in_order/domain/services/receive_services/receive_services.dart';
import 'package:home_in_order/domain/services/user/user_service.dart';
import 'package:home_in_order/modules/menu/menu_provider/menu_provider_controller.dart';

class HomeProviderInitialController extends GetxController {
  HomeProviderInitialController({
    required IUserService userService,
    required AuthService authService,
    required IReceiveServices receiveServices,
  })  : _userService = userService,
        _authService = authService,
        _receiveServices = receiveServices;
  @override
  void onInit() {
    getUserData();
    /* final data = Get.arguments;
    documentId = data[1]; */
    super.onInit();
  }

  final IUserService _userService;
  final AuthService _authService;
  final IReceiveServices _receiveServices;
  final userModelInfo = Rxn<UserProviderInformationModel>();
  final userModel = Rxn<UserAuthModel>();
  final avatarImage = ''.obs;
  final userId = ''.obs;
  String? documentId;

  Future<void> logout() async {
    await _userService.logout();
  }

  void changePage(int index) {
    Get.put(MenuProviderController()).changePage(index);
  }

  Future<void> getUserData() async {
    final user = _authService.user;

    if (user != null) {
      userId.value = user.uid;
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

  Future<void> moveDocumentToHistoric(
      String contractorId, String documentId) async {
    final user = _authService.user;

    if (user != null) {
      await _receiveServices.moveDocumentPendingToHistoric(
        user.uid,
        documentId,
        contractorId,
        ProviderHistoricModel(
          imageAvatar: userModel.value!.imageAvatar!,
          name: userModelInfo.value!.name!,
        ),
      );
    }
  }

  Future<void> moveDocumentActiveToHistoric(
      String contractorId, String documentId) async {
    final user = _authService.user;

    if (user != null) {
      await _receiveServices.moveDocumentActiveToHistoric(
        user.uid,
        documentId,
        contractorId,
        ProviderHistoricModel(
          imageAvatar: userModel.value!.imageAvatar!,
          name: userModelInfo.value!.name!,
        ),
      );
    }
  }
}
