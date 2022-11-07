import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:home_in_order/application/auth/auth_service.dart';

class HistoricController extends GetxController {
  HistoricController({required AuthService authService})
      : _authService = authService;

  @override
  void onInit() {
    userId.value = _authService.user!.uid;
    super.onInit();
    getUserType(userId.value);
  }

  final AuthService _authService;

  final userType = ''.obs;
  final userId = ''.obs;

  Future<void> getUserType(String id) async {
    final collectionRef =
        await FirebaseFirestore.instance.collection("users").doc(id).get();

    final collRef = collectionRef.data();

    userType.value = collRef!['user_type'];
  }
}
