import 'package:firebase_auth/firebase_auth.dart';

abstract class UserRepository {
  //Essa classe é uma interface
  Future<User?> register(String email, String password);
  Future<User?> login(String email, String password);
  Future<void> forgotPassword(String email);
  Future<User?> googleLogin();
  Future<User?> googleLogout();

}