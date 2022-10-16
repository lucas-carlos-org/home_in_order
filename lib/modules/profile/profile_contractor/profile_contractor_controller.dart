import 'package:get/get.dart';
import 'package:home_in_order/domain/services/user/user_service.dart';

class ProfileContractorController extends GetxController {
  ProfileContractorController({
    required IUserService userService,
  })  : _userService = userService;

  final IUserService _userService;


  Future<void> logout() async {
    await _userService.logout();
  }
}
