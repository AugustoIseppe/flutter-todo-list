import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo_list_app/app/repositories/user/user_repository.dart';
import 'package:todo_list_app/app/services/user/user_service.dart';

class UserServiceImpl implements UserService{

  final UserRepository _userRepository;

  UserServiceImpl({required UserRepository userRepository}) : _userRepository = userRepository;


  @override
  Future<User?> register(String email, String password) => _userRepository.register(email, password);
  
  @override
  Future<User?> login(String email, String password) => _userRepository.login(email, password);
  
  @override
  Future<void> forgotPassword(String email) => _userRepository.forgotPassword(email);
  
  @override
  Future<User?> googleLogin() => _userRepository.googleLogin();
  
  @override
<<<<<<< HEAD
  Future<void> logout() => _userRepository.logout();
=======
  Future<User?> googleLogout() => _userRepository.googleLogout();
>>>>>>> 6a9af048b28fd6d1f713f3cbbb6acd08d9513cf6
}