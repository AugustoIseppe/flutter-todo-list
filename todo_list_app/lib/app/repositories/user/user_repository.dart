import 'package:firebase_auth/firebase_auth.dart';

abstract class UserRepository {
  //Essa classe é uma interface
  Future<User?> register(String email, String password);
}