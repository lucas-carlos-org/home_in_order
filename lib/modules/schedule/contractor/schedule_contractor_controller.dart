import 'package:get/get.dart';
import 'package:home_in_order/application/auth/auth_service.dart';

class ScheduleContractorController extends GetxController {
  ScheduleContractorController({
    required AuthService authService,
  }) : _authService = authService;

  @override
  void onInit() {
    userId.value = _authService.user!.uid;
    super.onInit();
  }

  final AuthService _authService;

  final userId = ''.obs;
}