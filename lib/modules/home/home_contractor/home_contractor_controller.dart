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
  var listProviderPhotos = <String>[].obs;
  var userId = '';

  @override
  void onInit() {
    super.onInit();
    getUserData();
    getDocs();
  }

  Future<void> getUserData() async {
    final user = _authService.user;

    if (user != null) {
      userId = user.uid;
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
          imageAvatar: userRef['image_avatar']
              .toString()
              .replaceFirst("file:///", "https://"));

      userModelInfo.value = UserContractorInformationModel(
          name: '${docData['name']} ${docData['last_name'][0]}.');
    }
  }

  Future getDocs() async {
    final user = await FirebaseFirestore.instance.collection('users').get();
    for (int i = 0; i < user.docs.length; i++) {
      var userProvider = user.docs[i];
      final userInfo = await FirebaseFirestore.instance
          .collection("users")
          .doc(userProvider.id)
          .collection('personal_information')
          .get();

      final userInformation = userInfo.docs.first;

      if (userProvider['user_type'] == 'provider') {
        final userPhotos = await FirebaseFirestore.instance
            .collection("users")
            .doc(userProvider.id)
            .collection('job_images')
            .get();

        final photosOfProvider = userPhotos.docs;

        for (var photo in photosOfProvider) {
          listProviderPhotos.add(photo['get_image_job']);
        }

        listProviders.add(
          UserAuthModel(
              imageAvatar: userProvider['image_avatar'],
              deviceToken: userProvider['device_token'],
              email: userProvider['email'],
              userType: userProvider['user_type'],
              id: userProvider['id']),
        );

        listProviderInfo.add(UserProviderInformationModel(
          name: userInformation['name'],
          atuationArea: userInformation['atuation_area'],
          city: userInformation['city'],
          cpfOrCnpj: userInformation['cpf_or_cnpj'],
          experienceTime: userInformation['experience_time'],
          lastName: userInformation['last_name'],
          phoneNumber: userInformation['phone_number'],
          serviceDescription: userInformation['service_description'],
        ));
      }
    }
  }
}
