import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:home_in_order/application/auth/auth_service.dart';
import 'package:home_in_order/domain/models/user_model.dart';
import 'package:home_in_order/domain/services/image_picker/image_picker_service.dart';
import 'package:home_in_order/domain/services/user/user_service.dart';

class ProfileUserController extends GetxController {
  ProfileUserController({
    required IUserService userService,
    required IImagePickerService imagePickerService,
    required AuthService authService,
  })  : _userService = userService,
        _imagePickerService = imagePickerService,
        _authService = authService;

  @override
  void onReady() {
    getUserData();
    getDataOfService();
    super.onReady();
  }

  final IUserService _userService;
  final IImagePickerService _imagePickerService;
  final FirebaseFirestore firebase = FirebaseFirestore.instance;
  final AuthService _authService;
  final userModel = Rxn<UserModel>();

  var serviceCount = 0.obs;
  var finalizedServiceCount = 0.obs;
  final profilePhoto = ''.obs;

  Future<void> logout() async {
    await _userService.logout();
  }

  Future<void> getUserData() async {
    final user = _authService.user;

    if (user != null) {
      final docRef = await firebase
          .collection('users')
          .doc(user.uid)
          .collection('personal_information')
          .get();
      final userRef = await firebase.collection('users').doc(user.uid).get();
      final docData = docRef.docs[0];
      final imageAvatar = userRef['image_avatar'];
      final name = docData['name'];
      final lastName = userRef['user_type'] == 'provider'
          ? docData['last_name'][0]
          : docData['lastName'][0];

      userModel.value =
          UserModel(imageAvatar: imageAvatar, name: '$name $lastName.');
    }
  }

  Future<void> getDataOfService() async {
    final user = _authService.user;

    if (user != null) {
      final getCountService = await FirebaseFirestore.instance
          .collection("users/${user.uid}/historic_services")
          .get();

      serviceCount.value = getCountService.docs.length;
    }
  }

  Future<void> getImage() async {
    final imageData = await _imagePickerService.getImageFromGallery();

    if (imageData == null) {
      profilePhoto.value = '';
    } else {
      profilePhoto.value = imageData.toString();
    }
  }

  void removePhoto() {
    profilePhoto.value = '';
  }

  Future<void> deleteUserAccount() async {
    final user = _authService.user;

    if (user != null) {
      await _userService.deleteUserAccount(user.uid);
    }
  }
}
