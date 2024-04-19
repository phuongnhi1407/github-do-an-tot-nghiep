import 'dart:convert';

import 'package:doantotnghiep/src/modules/authen/dtos/models/profile_model.dart';
import 'package:doantotnghiep/src/modules/authen/dtos/request/delete_profile_request.dart';
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
  ProfileData? userInfo;
  AuthenService _authenService = AuthenService();

  Future<void> fetchLogin(BuildContext context, LoginRequest request) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      final response = await _authenService.login(request);
      if (response != null) {
        if (response.statusCode == 200) {
          user = response.data;
          if (user!.accessToken != null) {
            prefs.setString("token", user!.accessToken.toString());
            prefs.setInt("userId", user!.infoUser!.id!.toInt());
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

  Future<void> fetchProfile(BuildContext context) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    int userId = prefs.getInt("userId")!.toInt();

    try {
      final response = await _authenService.getProfile(userId);
      if (response != null) {
        if (response.statusCode == 200) {
          userInfo = response.data;
          // Hiển thị thông tin cá nhân hoặc làm gì đó với dữ liệu đã nhận được
        } else {
          // Xử lý lỗi nếu có
          ToastCustom().showBottom(context,
              msg: "Lỗi: ${response.message}", color: Colors.red);
        }
      } else {
        // Xử lý lỗi khi response là null
        ToastCustom().showBottom(context,
            msg: "Lỗi: Không nhận được dữ liệu từ máy chủ", color: Colors.red);
      }
    } catch (error) {
      // Xử lý lỗi nếu có
      print("Lỗi: $error");
      ToastCustom().showBottom(
          context, msg: "Lỗi: $error", color: Colors.red);
    }
  }

  Future<void> fetchDeleteProfile(BuildContext context) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      int userId = prefs.getInt("userId")!.toInt();
      final response = await _authenService.deleteAccount(userId);
      if (response != null) {
        if (response.statusCode == 200) {
          // Xóa tài khoản thành công
          // Hiển thị thông báo hoặc thực hiện các hành động khác tùy thuộc vào yêu cầu của bạn
        } else {
          // Xử lý lỗi từ phản hồi
          print("Error deleting account. Status code: ${response.statusCode}");
          // Hiển thị thông báo hoặc thực hiện các hành động khác tùy thuộc vào yêu cầu của bạn
        }
      } else {
        // Xử lý khi response là null
        print("Error deleting account: Null response");
        // Hiển thị thông báo hoặc thực hiện các hành động khác tùy thuộc vào yêu cầu của bạn
      }
    } catch (error) {
      // Xử lý lỗi nếu có
      print("Error deleting account: $error");
      // Hiển thị thông báo hoặc thực hiện các hành động khác tùy thuộc vào yêu cầu của bạn
    }
  }
}