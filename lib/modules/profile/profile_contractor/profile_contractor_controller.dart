import 'package:get/get.dart';
import 'package:home_in_order/application/auth/auth_service.dart';
import 'package:home_in_order/domain/services/user/user_service.dart';

class ProfileContractorController extends GetxController {
  ProfileContractorController({
    required IUserService userService,
    required AuthService authService,
  })  : _userService = userService,
        _authService = authService;

  final IUserService _userService;
  final AuthService _authService;


  Future<void> logout() async {
    await _userService.logout();
  }
}
