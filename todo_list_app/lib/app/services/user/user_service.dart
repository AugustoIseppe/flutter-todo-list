import 'package:firebase_auth/firebase_auth.dart';

abstract class UserService {
  Future<User?> register(String email, String password);
  Future<User?> login(String email, String password);
  Future<void> forgotPassword(String email);
  Future<User?> googleLogin();
<<<<<<< HEAD
  Future<void> logout();
=======
  Future<User?> googleLogout();
>>>>>>> 6a9af048b28fd6d1f713f3cbbb6acd08d9513cf6
}