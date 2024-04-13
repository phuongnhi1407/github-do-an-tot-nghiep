import 'package:doantotnghiep/src/modules/authen/dtos/request/signup_request.dart';
import 'package:doantotnghiep/src/modules/authen/services/authen_service_signup.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:doantotnghiep/src/modules/authen/dtos/models/login_model.dart';
import 'package:doantotnghiep/src/modules/authen/dtos/request/login_request.dart';
import 'package:doantotnghiep/src/modules/authen/pages/home.dart';
import 'package:doantotnghiep/src/modules/authen/services/authen_service.dart';

class AuthenProvider extends ChangeNotifier {
  LoginModel? user;
  AuthenService _authenService = AuthenService();

  Future<void> fetchLogin(BuildContext context, LoginRequest request) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      final response = await _authenService.login(request);
      if (response != null) {
        if (response.statusCode == 200) {
          user = response.data;
          if (user!.accessToken != null) {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
                  (Route<dynamic> route) => false,
            );
          }
        } else {
          // Handle error
          print("Error: ${response.message}");
          // Show toast or alert with error message
        }
      } else {
        // Handle null response
        print("Error: Null response");
        // Show toast or alert with error message
      }
    } catch (error) {
      // Handle error
      print("Error: $error");
      // Show toast or alert with error message
    }
  }
}
class AuthenProviderr extends ChangeNotifier {
  LoginModel? user;
  AuthenServiceSignup _authenServiceSignup = AuthenServiceSignup();

  Future<void> fetchSignUp(BuildContext context, SignUpRequest request) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      final response = await _authenServiceSignup.register(request);
      if (response != null) {
        if (response.statusCode == 200) {
          if (response.data is LoginModel) {
            user = response.data as LoginModel?;
            if (user!.accessToken != null) {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
                    (Route<dynamic> route) => false,
              );
            }
          } else {
            print("Lỗi: Dữ liệu không hợp lệ");
            // Hiển thị thông báo hoặc xử lý lỗi
          }
        } else {
          print("Lỗi: ${response.message}");
          // Hiển thị thông báo hoặc xử lý lỗi
        }
      } else {
        print("Lỗi: Phản hồi null");
        // Hiển thị thông báo hoặc xử lý lỗi
      }
    } catch (error) {
      print("Lỗi: $error");
      // Hiển thị thông báo hoặc xử lý lỗi
    }
  }
}