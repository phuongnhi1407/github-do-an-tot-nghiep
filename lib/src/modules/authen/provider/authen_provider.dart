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
        if (value.statusCode != 200) {
          print("Error: " + value.message.toString());
        } else {
          user = value.data;
          if (user!.accessToken != null) {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
              (Route<dynamic> route) => false,
            );
          }
        }
      }
    });
  }
}

// model view --> logic code
