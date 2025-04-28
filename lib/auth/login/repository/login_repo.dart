import 'package:flutter_logic/auth/login/model/login_model.dart';
import 'package:flutter_logic/auth/login/service/login_service.dart';

class LoginRepo {
  // 1 create object from login service
  final LoginService loginService;
  // 2 put to construvtor
  LoginRepo({required this.loginService});
  // 3 create function from Model

  Future<LoginResponse> login({
    // 4 parameter
    required String email,
    required String password,
  }) async {
    // 5 try & catch
    try {
      // 6 join to login service
      return await loginService.login(
        email: email,
        password: password,
      );
    } catch (error) {
      // 7 rethrow error
      rethrow;
    }
  }
}
