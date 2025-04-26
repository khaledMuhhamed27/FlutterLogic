import 'dart:convert';
import 'package:flutter_logic/auth/register/model/register_model.dart';
import 'package:flutter_logic/constant/helper.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_logic/constant/config.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterService {
  // url
  final String baseUrlR = "$baseUrl/register";
  // requird inputs
  Future<RegisterResponse> register({
    required String name,
    required String email,
    required String phone,
    required String password,
    required String passwordConfirmation,
  }) async {
    // url.parse
    final url = Uri.parse(baseUrlR);
    // try & catch
    try {
      // response
      final response = await http.post(
          // 1 url
          url,
          // headers
          headers: {
            'Accept': 'application/json',
          },
          // 3 body
          body: {
            "name": name,
            "email": email,
            "password": password,
            "password_confirmation": passwordConfirmation,
            "phone": phone,
          });
      // Data
      final data = jsonDecode(response.body);
      // if status
      if (response.statusCode == 200 || response.statusCode == 201) {
        // SharedPrefernces
        SharedPreferences prefs = await SharedPreferences.getInstance();
        // clean token
        await prefs.remove('token');
        // token save
        String token = data['data']?['token'] as String? ?? '';
        prefs.setString('token', token);
        // return data
        return RegisterResponse.fromJson(data);
        // else
      } else {
        throw transformErrors(data);
      }
      // return error
    } catch (error) {
      throw "An unexpected error occurred: $error";
    }
  }
}
