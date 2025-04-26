import 'package:flutter_logic/auth/register/model/register_model.dart';
import 'package:flutter_logic/auth/register/service/register_service.dart';

class RegisterRepo {
  // create object
  final RegisterService registerService;
  // add to constructor required
  RegisterRepo({required this.registerService});
  // create function for register
  Future<RegisterResponse> register({
    // add all parameter
    required String name,
    required String email,
    required String password,
    required String confirmPassword,
    required String phone,
  }) async {
    // try & catch
    try {
      // join to register function service
      return await registerService.register(
          name: name,
          email: email,
          phone: phone,
          password: password,
          passwordConfirmation: confirmPassword);
    } catch (e) {
      rethrow;
    }
  }
}
