import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:home_in_order/application/auth/auth_service.dart';
import 'package:home_in_order/domain/models/user_contractor_information_model.dart';
import 'package:home_in_order/domain/models/user_provider_information_model.dart';

class ProfileDataController extends GetxController {
  ProfileDataController({
    required AuthService authService,
  }) : _authService = authService;

  @override
  void onReady() {
    getUserData();
    super.onReady();
  }

  final AuthService _authService;
  final FirebaseFirestore firebase = FirebaseFirestore.instance;
  final contractorModel = Rxn<UserContractorInformationModel>();
  final providerModel = Rxn<UserProviderInformationModel>();
  final userType = ''.obs;

  Future<void> getUserData() async {
    final user = _authService.user;

    if (user != null) {
      final docRef = await firebase
          .collection('users')
          .doc(user.uid)
          .collection('personal_information')
          .get();

      final userRefs = await firebase.collection('users').doc(user.uid).get();
      final docData = docRef.docs[0];
      final userRef = userRefs.data();
      userType.value = userRef!['user_type'];

      userRef['user_type'] == 'contractor'
          ? contractorModel.value = UserContractorInformationModel(
              adress: docData['adress'],
              city: docData['city'],
              lastName: docData['lastName'],
              name: docData['name'],
              number: docData['number'],
            )
          : providerModel.value = UserProviderInformationModel(
              atuationArea: docData['atuation_area'],
              city: docData['city'],
              cpfOrCnpj: docData['cpf_or_cnpj'],
              experienceTime: docData['experience_time'],
              lastName: docData['last_name'],
              name: docData['name'],
              phoneNumber: docData['phone_number'],
              serviceDescription: docData['service_description'],
            );
    }
  }
}
