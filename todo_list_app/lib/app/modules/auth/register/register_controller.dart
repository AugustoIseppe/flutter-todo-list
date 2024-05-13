import 'package:todo_list_app/app/core/notifier/default_change_notifier.dart';
import 'package:todo_list_app/app/exception/auth_exception.dart';
import 'package:todo_list_app/app/services/user/user_service.dart';

class RegisterController extends DefaultChangeNotifier {
  final UserService _userService;

  

  RegisterController({required UserService userService})
      : _userService = userService;

  Future<void> registerUser(String email, String password) async {
    try {
      showLoadingAndResetState();
      notifyListeners();
      final user = await _userService.register(email, password);
      if (user != null) {
        success();
      } else {
        setError("Erro ao registar usuário");
      }
      notifyListeners();
    } on AuthException catch (e) {
      setError(e.message);
    } finally {
      hideLoading();
      notifyListeners();
    }
  }
}
