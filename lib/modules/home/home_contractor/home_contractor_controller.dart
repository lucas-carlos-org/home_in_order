import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:home_in_order/application/auth/auth_service.dart';
import 'package:home_in_order/domain/models/provider_model.dart';
import 'package:home_in_order/domain/models/user_model.dart';
import 'package:home_in_order/modules/menu/menu_contractor/menu_contractor_controller.dart';

class HomeContractorController extends GetxController {
  HomeContractorController({
    required AuthService authService,
  }) : _authService = authService;

  @override
  void onInit() {
    getUserData();
    getDocs();
    super.onInit();
  }

  final AuthService _authService;
  final FirebaseFirestore firebase = FirebaseFirestore.instance;
  final userModel = Rxn<UserModel>();

  final listProvider = <ProviderModel>[].obs;
  final listProviderSearch = <ProviderModel>[];

  var userId = '';
  var selectedValue = 'serviços'.obs;
  final searching = false.obs;
  final isLoading = false.obs;

  Future<void> getUserData() async {
    final user = _authService.user;

    if (user != null) {
      userId = user.uid;
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

  Future getDocs() async {
    isLoading.value = true;
    searching.value = true;
    listProvider.clear();
    listProviderSearch.clear();

    final user = await firebase.collection('users').get();
    for (int i = 0; i < user.docs.length; i++) {
      var userProvider = user.docs[i];
      final userInfo = await firebase
          .collection("users")
          .doc(userProvider.id)
          .collection('personal_information')
          .get();

      final userInformation = userInfo.docs.first;

      if (userProvider['user_type'] == 'provider') {
        final userPhotos = await firebase
            .collection("users")
            .doc(userProvider.id)
            .collection('job_images')
            .get();

        final photosOfProvider = userPhotos.docs;

        final listOfPhotos = <String>[];
        for (var photo in photosOfProvider) {
          listOfPhotos.add(
            photo['get_image_job'],
          );
        }

        final providerModel = ProviderModel(
          imageAvatar: userProvider['image_avatar'],
          deviceToken: userProvider['device_token'],
          userType: userProvider['user_type'],
          id: userProvider['id'],
          name: userInformation['name'],
          atuationArea: userInformation['atuation_area'],
          city: userInformation['city'],
          experienceTime: userInformation['experience_time'],
          lastName: userInformation['last_name'],
          phoneNumber: userInformation['phone_number'],
          serviceDescription: userInformation['service_description'],
          photos: listOfPhotos,
        );

        listProvider.add(providerModel);
        listProviderSearch.add(providerModel);
      }
    }
    searching.value = false;
    isLoading.value = false;
  }

  void searchItemByService(String service) {
    isLoading.value = true;
    if (service.isNotEmpty) {
      var newListProviders = listProviderSearch.where((m) {
        return m.atuationArea.toLowerCase().contains(service.toLowerCase());
      });

      newListProviders.isEmpty
          ? searching.value = true
          : searching.value = false;

      listProvider.clear();
      listProvider.addAll(newListProviders);
    } else {
      listProvider.clear();
      listProvider.addAll(listProviderSearch);
    }
    isLoading.value = false;
  }

  void changePage(int index) {
    Get.put(MenuContractorController()).changePage(index);
  }
}
