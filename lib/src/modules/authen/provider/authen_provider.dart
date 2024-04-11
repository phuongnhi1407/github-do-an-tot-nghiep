import 'package:doantotnghiep/src/modules/authen/dtos/models/login_model.dart';
import 'package:doantotnghiep/src/modules/authen/dtos/request/login_request.dart';
import 'package:doantotnghiep/src/modules/authen/pages/home.dart';
import 'package:doantotnghiep/src/modules/authen/services/authen_service.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthenProvider extends ChangeNotifier {
  // Tao 1 provder user
  LoginModel? user;

  // global ........
  AuthenService _authenService = new AuthenService();
  fetchLogin(BuildContext context, LoginRequest request) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await _authenService.login(request).then((value) async {
      if (value != null) {
        user = value;
        await prefs.setString('token', user!.accessToken.toString());
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
          (Route<dynamic> route) => false,
        );
        print("Đăng nhập thành công: ${user!.accessToken}");
      } else {
        print("Đăng nhập thất bại");
      }
    });
  }
}

// model view --> logic code
