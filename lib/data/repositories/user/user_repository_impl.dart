import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:home_in_order/application/exceptions/auth_exception.dart';
import 'package:home_in_order/application/exceptions/failure.dart';
import 'package:home_in_order/domain/models/user_auth_model.dart';

import 'package:home_in_order/data/repositories/user/user_repository.dart';

class UserRepositoryImpl implements IUserRepository {
  @override
  Future<User?> loginWithEmail(String email, String password) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return credential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        log('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        log('Wrong password provided for that user.');
      }
    }
    throw Exception('Erro ao realizar o login com o email');
  }

  @override
  Future<void> logout() async {
    await GoogleSignIn().signOut();
    FirebaseAuth.instance.signOut();
  }

  @override
  Future<UserCredential> loginWithGoogle() async {
    final googleUser = await GoogleSignIn().signIn();
    final googleAuth = await googleUser?.authentication;

    if (googleAuth != null) {
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      return FirebaseAuth.instance.signInWithCredential(credential);
    }

    throw Exception('Erro ao realizar o login com o Google');
  }

  @override
  Future<String> getDeviceToken() async {
    final deviceToken = await FirebaseMessaging.instance.getToken();
    return deviceToken!;
  }

  @override
  Future<void> saveUserOnStorage(
      String userId, UserAuthModel userAuthModel) async {
    try {
      var collectionRef = FirebaseFirestore.instance.collection('users');

      var doc = await collectionRef.doc(userId).get();
      if (!doc.exists) {
        final userStorage =
            FirebaseFirestore.instance.collection('users').doc(userId);

        final userData = userAuthModel;
        Map<String, dynamic> userDataToMap = userData.toMap();

        await userStorage.set(userDataToMap);
      }
    } catch (e) {
      throw Failure(message: 'Error ao salvar dados do usuario!');
    }
  }

  @override
  Future<void> setUserType(String userId, String typeUser) async {
    try {
      final userModelType =
          FirebaseFirestore.instance.collection('users').doc(userId);

      Map<String, dynamic> data = <String, dynamic>{
        "user_type": typeUser,
        "is_first_time": false,
      };
      await userModelType.update(data);
    } catch (e) {
      throw Exception('Error');
    }
  }

  @override
  Future<void> forgotPassword(String email) async {
    try {
      final loginTypes =
          await FirebaseAuth.instance.fetchSignInMethodsForEmail(email);

      if (loginTypes.contains('password')) {
        await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      } else if (loginTypes.contains('google')) {
        throw AuthException(
            message:
                'Cadastro realizado com o Google, não pode ser resetado a senha');
      } else {
        throw AuthException(message: 'E-mail não cadastrado');
      }
    } on PlatformException catch (e, s) {
      log(e.toString());
      log(s.toString());
      throw AuthException(message: 'Erro ao resetar senha');
    }
  }

  @override
  Future<User?> register(String email, String password) async {
    try {
      final userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return userCredential.user;
    } on FirebaseAuthException catch (e, s) {
      log(e.toString());
      log(s.toString());
      if (e.code == 'email-already-in-use') {
        final loginTypes =
            await FirebaseAuth.instance.fetchSignInMethodsForEmail(email);
        if (loginTypes.contains('password')) {
          throw AuthException(
              message: 'E-mail já utiliado, por favor escolha outro e-mail');
        } else {
          throw AuthException(
              message:
                  'Você se cadastrando pelo Google, por favor utilize ele para fazer o login');
        }
      } else {
        throw AuthException(message: e.message ?? 'Erro ao registrar usuario');
      }
    }
  }

  @override
  Future<void> updateDeviceToken(String userId) async {
    try {
      final docRef = await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .get();
      final updateCollectionRef =
          FirebaseFirestore.instance.collection('users').doc(userId);

      final deviceTokenValue = await getDeviceToken();
      final colection = docRef.data();

      if (colection != null) {
        if (colection['device_token'] != deviceTokenValue) {
          Map<String, dynamic> data = <String, dynamic>{
            "device_token": deviceTokenValue,
          };
          await updateCollectionRef.update(data);
        }
      }
    } catch (e) {
      throw Failure(message: e.toString());
    }
  }
}
