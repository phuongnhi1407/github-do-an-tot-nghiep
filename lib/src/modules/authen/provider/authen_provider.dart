import 'package:doantotnghiep/src/modules/authen/dtos/request/login_request.dart';
import 'package:doantotnghiep/src/modules/authen/pages/home.dart';
import 'package:doantotnghiep/src/modules/authen/services/authen_service.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthenProvider extends ChangeNotifier {
  // global ........
  AuthenService _authenService = new AuthenService();
  fetchLogin(BuildContext context, LoginRequest request) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await _authenService.login(request).then((value) async {
      if (value != null) {
        // luu vao may, --> token thi ton 
        await prefs.setString('token', value.token.toString());
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
          (Route<dynamic> route) => false,
        );
        print("Đăng nhập thành công: ${value.token}");
      } else {
        print("Đăng nhập thất bại");
      }
    });
  }
}

// model view --> logic code 
