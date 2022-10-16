import 'package:firebase_auth/firebase_auth.dart';
import 'package:home_in_order/domain/models/user_auth_model.dart';

abstract class IUserService {
  Future<User?> loginWithEmail(String email, String password);
  Future<UserCredential> loginWithGoogle();
  Future<User?> register(String email, String password);
  Future<void> forgotPassword(String email);
  Future<void> logout();
  Future<void> saveUserOnStorage(String userId, UserAuthModel userAuthModel);
    Future<void> updateDeviceToken(String userId);
  Future<String> getDeviceToken();
  Future<void> setUserType(String userId, String typeUser);
  
}
