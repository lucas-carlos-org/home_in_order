import 'package:firebase_auth/firebase_auth.dart';
import 'package:home_in_order/domain/models/user_auth_model.dart';
import 'package:home_in_order/data/repositories/user/user_repository.dart';
import 'package:home_in_order/domain/services/user/user_service.dart';

class UserServiceImpl implements IUserService {
  UserServiceImpl({
    required IUserRepository userRepository,
  }) : _userRepository = userRepository;

  final IUserRepository _userRepository;

  @override
  Future<User?> loginWithEmail(String email, String password) =>
      _userRepository.loginWithEmail(email, password);

  @override
  Future<void> logout() async => _userRepository.logout();

  @override
  Future<UserCredential> loginWithGoogle() async =>
      _userRepository.loginWithGoogle();

  @override
  Future<String> getDeviceToken() => _userRepository.getDeviceToken();

  @override
  Future<void> saveUserOnStorage(String userId, UserAuthModel userAuthModel) =>
      _userRepository.saveUserOnStorage(userId, userAuthModel);

  @override
  Future<void> setUserType(String userId, String typeUser) =>
      _userRepository.setUserType(userId, typeUser);

  @override
  Future<void> forgotPassword(String email) =>
      _userRepository.forgotPassword(email);

  @override
  Future<User?> register(String email, String password) =>
      _userRepository.register(email, password);

  @override
  Future<void> updateDeviceToken(String userId) =>
      _userRepository.updateDeviceToken(userId);
}
