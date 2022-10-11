import 'dart:developer';
import 'package:get/get.dart';
import 'package:home_in_order/application/auth/auth_service.dart';
import 'package:home_in_order/application/exceptions/auth_exception.dart';
import 'package:home_in_order/application/ui/loader/loader_mixin.dart';
import 'package:home_in_order/application/ui/messages/messages_mixin.dart';
import 'package:home_in_order/domain/models/user_auth_model.dart';
import 'package:home_in_order/domain/services/user/user_service.dart';

class LoginController extends GetxController with LoaderMixin, MessagesMixin {
  LoginController({
    required IUserService userService,
    required AuthService authService,
  })  : _userService = userService,
        _authService = authService;

  final IUserService _userService;
  final AuthService _authService;
  final loading = false.obs;
  final message = Rxn<MessageModel>();
  var deviceToken = '';

  @override
  void onInit() async {
    super.onInit();
    loaderListener(loading);
    messageListener(message);
    deviceToken = await _userService.getDeviceToken();
  }

  Future<void> loginWithEmail(String email, String password) async {
    try {
      loading(true);
      final user = await _userService.loginWithEmail(email, password);
      if (user != null) {
        saveUserOnStorage(
          UserAuthModel(
              diveceToken: deviceToken,
              email: user.email,
              name: user.displayName,
              imageAvatar: user.photoURL,
              isFirstTime: true,
              userType: null,
              id: user.uid),
        );
        loading(false);
        message(
          MessageModel.info(
              title: 'Sucesso', message: 'Login realizado com sucesso!'),
        );
      } else {
        message(
          MessageModel.info(
              title: 'Atençao', message: 'Usuario ou senha invalido!'),
        );
        loading(false);
      }
    } on AuthException catch (e) {
      log('[Error:] $e.toString()');
      loading(false);
    } finally {
      loading(false);
    }
  }

  Future<void> loginWithGoogle() async {
    try {
      loading(true);
      final credentials = await _userService.loginWithGoogle();
      saveUserOnStorage(
        UserAuthModel(
            diveceToken: deviceToken,
            email: credentials.user!.email,
            name: credentials.user!.displayName,
            imageAvatar: credentials.user!.photoURL,
            isFirstTime: true,
            userType: null,
            id: credentials.user!.uid),
      );
      loading(false);
      message(MessageModel.info(
          title: 'Sucesso', message: 'Login realizado com sucesso!'));
    } catch (e, s) {
      log(e.toString());
      log(s.toString());
      loading(false);
      message(MessageModel.error(
          title: 'Erro', message: 'Erro ao realizar login!'));
    }
  }

  Future<void> saveUserOnStorage(UserAuthModel userAuthModel) async {
    try {
      final user = _authService.user;

      await _userService.saveUserOnStorage(user!.uid, userAuthModel);
    } catch (e) {
      log(e.toString());
    }
  }
}
