import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:todo_list_app/app/exception/auth_exception.dart';
import 'package:todo_list_app/app/repositories/user/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  FirebaseAuth _firebaseAuth;
  UserRepositoryImpl({required firebaseAuth}) : _firebaseAuth = firebaseAuth;

  @override
  Future<User?> register(String email, String password) async {
    try {
      final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      return userCredential.user;
    } on FirebaseAuthException catch (e, s) {
      debugPrint(e.toString());
      debugPrint(s.toString());
      //email-already-exists
      if(e.code == 'email-already-in-use') {
        final loginTypes = await _firebaseAuth.fetchSignInMethodsForEmail(email);
        if(loginTypes.contains('password')) {
          throw AuthException(message: 'E-mail já utilizado, cadastre um e-mail diferente');
        } else {
          AuthException(message: 'Voce se cadastrou pelo Google, utilize-o para fazer o login');
        }
      } else {
        throw AuthException(message: e.message ?? 'Errro ao registar usuário');
      }
    }
  }
}
