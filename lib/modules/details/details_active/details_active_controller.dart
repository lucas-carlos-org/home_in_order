import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:home_in_order/application/auth/auth_service.dart';
import 'package:home_in_order/domain/models/file_model.dart';
import 'package:home_in_order/domain/models/provider_historic_model.dart';
import 'package:home_in_order/domain/models/user_auth_model.dart';
import 'package:home_in_order/domain/models/user_provider_information_model.dart';
import 'package:home_in_order/domain/services/receive_services/receive_services.dart';

class DetailsActiveController extends GetxController {
  DetailsActiveController({
    required IReceiveServices iReceiveServices,
    required AuthService authService,
  })  : _receiveServices = iReceiveServices,
        _authService = authService;

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

  Future<void> moveDocumentToHistoric(String contractorId) async {
    final user = _authService.user;

    if (user != null) {
      await _receiveServices.moveDocumentActiveToHistoric(
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
}
