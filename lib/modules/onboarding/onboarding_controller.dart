import 'package:get/get.dart';
import 'package:home_in_order/application/auth/auth_service.dart';
import 'package:home_in_order/domain/services/user/user_service.dart';

class OnboardingController extends GetxController {
  OnboardingController({
    required IUserService userService,
    required AuthService authService,
  })  : _userService = userService,
        _authService = authService;

  final IUserService _userService;
  final AuthService _authService;

  final userTypeValue = ''.obs;

  var hasUser = false.obs;
  var hasProvider = false.obs;

  Future<void> setUserType(String value) async {
    final user = _authService.user;
    await _userService.setUserType(user!.uid, value);
  }
}
