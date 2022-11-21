import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:home_in_order/application/auth/auth_service.dart';
import 'package:home_in_order/domain/models/file_model.dart';
import 'package:home_in_order/domain/models/provider_model.dart';
import 'package:home_in_order/domain/models/request_service_model.dart';
import 'package:home_in_order/domain/models/user_auth_model.dart';
import 'package:home_in_order/domain/models/user_contractor_information_model.dart';
import 'package:home_in_order/domain/services/image_picker/image_picker_service.dart';
import 'package:home_in_order/domain/services/receive_services/receive_services.dart';
import 'package:home_in_order/domain/services/request_services/request_service.dart';

class ContractProviderController extends GetxController {
  ContractProviderController({
    required IRequestService requestService,
    required IReceiveServices receiveServices,
    required AuthService authService,
    required IImagePickerService imagePickerService,
  })  : _requestService = requestService,
        _receiveServices = receiveServices,
        _authService = authService,
        _imagePickerService = imagePickerService;

  final IRequestService _requestService;
  final IReceiveServices _receiveServices;
  final AuthService _authService;
  final IImagePickerService _imagePickerService;

  final userModelInfo = Rxn<UserContractorInformationModel>();
  final userModel = Rxn<UserAuthModel>();
  final avatarImage = ''.obs;
  final userId = ''.obs;

  final problemPhotoOne = ''.obs;
  final problemPhotoTwo = ''.obs;
  final problemPhotoThree = ''.obs;
  var listOfImages = <FileModel>[].obs;
  final providerModel = Rxn<ProviderModel>();

  @override
  void onInit() {
    final data = Get.arguments;
    providerModel.value = data[0];
    getUserData();
    super.onInit();
  }

  Future<void> getUserData() async {
    final user = _authService.user;

    if (user != null) {
      userId.value = user.uid;
      final docRef = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .collection('personal_information')
          .get();

      final userRef = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();

      final docData = docRef.docs[0];

      userModel.value = UserAuthModel(
          deviceToken: userRef['device_token'],
          id: userRef['id'],
          imageAvatar: userRef['image_avatar']
              .toString()
              .replaceFirst("file:///", "https://"));

      final name = docData['name'];
      final lastName = docData['lastName'][0];
      final city = docData['city'];
      final adress = docData['adress'];
      final number = docData['number'];

      userModelInfo.value = UserContractorInformationModel(
        name: '$name $lastName.',
        city: city,
        adress: adress,
        number: number,
      );
    }
  }

  Future<void> createNewRequestService(String providerId,
      String descriptionText) async {
    if (problemPhotoOne.value.isNotEmpty) {
      listOfImages.add(FileModel(imagePath: problemPhotoOne.value));
    }
    if (problemPhotoTwo.value.isNotEmpty) {
      listOfImages.add(FileModel(imagePath: problemPhotoTwo.value));
    }
    if (problemPhotoThree.value.isNotEmpty) {
      listOfImages.add(FileModel(imagePath: problemPhotoThree.value));
    }

    final user = _authService.user;

    _requestService.sendRequestService(
      user!.uid,
      providerId,
      RequestServiceModel(
        contractorId: user.uid,
        providerId: providerId,
        id: userId.value,
        imageAvatar: userModel.value!.imageAvatar.toString(),
        name: '${userModelInfo.value!.name}',
        deviceToken: userModel.value!.deviceToken.toString(),
        createAt: DateTime.now(),
        city: userModelInfo.value!.city!,
        address: userModelInfo.value!.adress!,
        number: userModelInfo.value!.number!,
        description: descriptionText,
        files: listOfImages,
      ),
    );
  }

  Future<void> sendPushNotification(String token) async {
    _receiveServices.sendPushMessage('Nova Solicitação 😊',
        'Você recebeu uma nova solicitação de serviço!', token);
  }

  void goToHome() {
    Get.back();
    Get.back();
    Get.back();
    Get.back();
  }

  Future<void> getProblemImages(RxString stringVal) async {
    final imageData = await _imagePickerService.getImageFromGallery();

    if (imageData == null) {
      stringVal.value = '';
    } else {
      stringVal.value = imageData.toString();
    }
  }

  Future<void> removePhoto(RxString stringVal) async {
    stringVal.value = '';
  }
}
