import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:home_in_order/application/auth/auth_service.dart';
import 'package:home_in_order/domain/models/user_auth_model.dart';
import 'package:home_in_order/domain/models/user_contractor_information_model.dart';
import 'package:home_in_order/domain/models/user_provider_information_model.dart';

class HomeContractorController extends GetxController {
  HomeContractorController({
    required AuthService authService,
  }) : _authService = authService;

  final AuthService _authService;
  final userModelInfo = Rxn<UserContractorInformationModel>();
  final userModel = Rxn<UserAuthModel>();
  final avatarImage = ''.obs;

  var listProviders = <UserAuthModel>[].obs;
  var listProviderInfo = <UserProviderInformationModel>[].obs;

  @override
  void onInit() {
    getUserData();
    getDocs();
    super.onInit();
  }

  Future<void> getUserData() async {
    final user = _authService.user;

    if (user != null) {
      final docRef = await FirebaseFirestore.instance
          .collection("users/${user.uid}/userPersonalInformation/")
          .get();
      final userRef = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();

      final docData = docRef.docs[0];

      userModel.value = UserAuthModel(
          imageAvatar: userRef['imageAvatar']
              .toString()
              .replaceFirst("file:///", "https://"));

      userModelInfo.value = UserContractorInformationModel(
          name: '${docData['name']} ${docData['lastName'][0]}.');
    }
  }

  Future getDocs() async {
    QuerySnapshot user =
        await FirebaseFirestore.instance.collection("users").get();
    for (int i = 0; i < user.docs.length; i++) {
      var userProvider = user.docs[i];
      QuerySnapshot userInfo = await FirebaseFirestore.instance
          .collection("users")
          .doc(userProvider.id)
          .collection('userPersonalInformation')
          .get();
      final userInformation = userInfo.docs.first;

      if (userProvider['userType'] == 'provider') {
        listProviders.add(
          UserAuthModel(
            imageAvatar: userProvider['imageAvatar'],
            diveceToken: userProvider['diveceToken'],
            email: userProvider['email'],
            userType: userProvider['userType'],
          ),
        );

        listProviderInfo.add(UserProviderInformationModel(
          name: userInformation['name'],
          atuationArea: userInformation['atuationArea'],
          city: userInformation['city'],
          cpfOrCnpj: userInformation['cpfOrCnpj'],
          expirenceTime: userInformation['expirenceTime'],
          lastName: userInformation['lastName'],
          phoneNumber: userInformation['phoneNumber'],
          serviceDescription: userInformation['serviceDescription'],
        ));
      }
    }
  }
}