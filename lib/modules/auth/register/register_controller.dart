import 'dart:developer';

import 'package:get/get.dart';
import 'package:home_in_order/application/exceptions/auth_exception.dart';
import 'package:home_in_order/application/ui/loader/loader_mixin.dart';
import 'package:home_in_order/application/ui/messages/messages_mixin.dart';
import 'package:home_in_order/domain/services/user/user_service.dart';

class RegisterController extends GetxController
    with LoaderMixin, MessagesMixin {
  RegisterController({
    required IUserService userService,
  }) : _userService = userService;

  final IUserService _userService;
  final loading = false.obs;
  final message = Rxn<MessageModel>();

  @override
  void onInit() {
    super.onInit();
    loaderListener(loading);
    messageListener(message);
  }

  Future<void> register(String email, String password) async {
    try {
      loading(true);
      await _userService.register(email, password);
      await _userService.logout();
      loading(false);
      message(
        MessageModel.info(
            title: 'Sucesso', message: 'Conta criada com sucesso!'),
      );
    } on AuthException catch (e) {
      loading(false);
      message(
        MessageModel.error(title: 'Erro', message: e.message.toString()),
      );
      log(e.toString());
    } finally {
      loading(false);
    }
  }
}
