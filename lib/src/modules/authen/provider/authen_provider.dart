import 'dart:convert';

import 'package:doantotnghiep/src/modules/authen/dtos/request/signup_request.dart';
import 'package:doantotnghiep/src/modules/authen/pages/login.dart';
import 'package:doantotnghiep/src/widgets/toast/toast.dart';
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
            ToastCustom().showBottom(context,
                msg: "Đăng nhập thành công", color: Colors.green);
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

  Future<void> fetchSignUp(BuildContext context, SignUpRequest request) async {
    try {
      final response = await _authenService.register(request);
      if (response != null) {
        if (response.statusCode == 200) {
          ToastCustom().showBottom(context,
              msg: "Đăng ký thành công", color: Colors.green);
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => LoginScreen()),
            (Route<dynamic> route) => false,
          );
        } else {
          ToastCustom().showBottom(context,
              msg: "${json.decode(response.message.toString())[0]['value']}",
              color: Colors.red);
        }
      }
    } catch (error) {
      print("Lỗi: $error");
      // Hiển thị thông báo hoặc xử lý lỗi
    }
  }
}
