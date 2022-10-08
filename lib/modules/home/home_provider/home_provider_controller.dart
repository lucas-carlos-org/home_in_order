import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:home_in_order/application/auth/auth_service.dart';
import 'package:home_in_order/domain/models/user_personal_information_model.dart';
import 'package:home_in_order/domain/services/user/user_service.dart';

class HomeProviderController extends GetxController {
  HomeProviderController({
    required IUserService userService,
    required AuthService authService,
  })  : _userService = userService,
        _authService = authService;

  final IUserService _userService;
  final AuthService _authService;
  final userModelInfo = Rxn<UserPersonalInformationModel>();
  final avatarImage = ''.obs;

  @override
  void onInit() {
    getUserData();
    super.onInit();
  }

  Future<void> logout() async {
    await _userService.logout();
  }

  void getUserData() async {
    final user = _authService.user;

    if (user != null) {
      final docRef = await FirebaseFirestore.instance.collection("users/${user.uid}/userPersonalInformation/").get();
      final userRef = await FirebaseFirestore.instance.collection('users').doc(user.uid).get();


      final docData = docRef.docs[0];

      avatarImage.value =  userRef['imageAvatar'];

      userModelInfo.value = UserPersonalInformationModel(
        name: '${docData['name']} ${docData['lastName']}'
      );

    }
  }
}
