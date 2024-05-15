import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:todo_list_app/app/exception/auth_exception.dart';
import 'package:todo_list_app/app/repositories/user/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final FirebaseAuth _firebaseAuth;

  UserRepositoryImpl({required FirebaseAuth firebaseAuth})
      : _firebaseAuth = firebaseAuth;

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
      // if(e.code == 'email-already-in-use') {
      //   // final loginTypes = await _firebaseAuth.fetchSignInMethodsForEmail(email);
      //   // if(loginTypes.contains('password')) {
      //     // throw AuthException(message: 'E-mail já utilizado, cadastre um e-mail diferente');
      //   // } else {
      //     // AuthException(message: 'Voce se cadastrou pelo Google, utilize-o para fazer o login');
      //   // }
      // } else {
      //   throw AuthException(message: e.message ?? 'Errro ao registar usuário');
      // }
    }
  }

  @override
  Future<User?> login(String email, String password) async {
    try {
      final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return userCredential.user;
    } on PlatformException catch (e, s) {
      print(e);
      print(s);
      throw AuthException(message: e.message ?? 'Erro ao realizar login');
    } on FirebaseAuthException catch (e, s) {
      print(e);
      print(s);
      if (e.code == 'wrong-password') {
        throw AuthException(message: 'Login ou senha inválidos');
      }
      throw AuthException(message: e.message ?? 'Falha ao realizar login');
    }
  }

  @override
  Future<void> forgotPassword(String email) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
    } on PlatformException catch (e) {
      print(e);
      throw AuthException(message: 'Erro ao resetar senha');
    }
    // final loginMethods = await _firebaseAuth.fetchSignInMethodsForEmail(email);
    // if(loginMethods.contains('password')) {
    //   await _firebaseAuth.sendPasswordResetEmail(email: email);
    // }
  }
  
  @override
  Future<User?> googleLogin() async {
    final googleSignIn = GoogleSignIn();
    final googleUser = await googleSignIn.signIn(); 
  }
  
  @override
  Future<void> logout() async {
    await GoogleSignIn().signOut();
    _firebaseAuth.signOut();
  }
}
