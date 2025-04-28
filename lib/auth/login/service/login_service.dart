import 'dart:convert';

import 'package:flutter_logic/auth/login/model/login_model.dart';
import 'package:flutter_logic/constant/config.dart';
import 'package:flutter_logic/constant/helper.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginService {
  //1 Url
  final String url = "$baseUrl/login";
  // 2 function
  Future<LoginResponse> login({
    required String email,
    required String password,
  }) async {
    // 3 join url
    final fUrl = Uri.parse(url);
    //4 try & catch
    try {
      //5 create response
      final response = await http.post(
        fUrl,
        headers: {
          'Accept': 'application/json',
        },
        body: {
          "email": email,
          "password": password,
        },
      );
      // 6 data Decode
      final dynamic data = jsonDecode(response.body);
      // 7 if Statement
      if (response.statusCode == 200) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.remove("token");
        //8 save token
        String token = data['data']?['token'] as String? ?? '';
        prefs.setString("token", token);
     
        // 9 return
        return LoginResponse.fromJson(data);
      } else {
        throw transformErrors(data);
      }
    } catch (error) {
      throw "An unexpected error occurred: $error";
    }
  }
}
