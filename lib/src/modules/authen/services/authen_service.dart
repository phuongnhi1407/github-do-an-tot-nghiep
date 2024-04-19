import 'dart:convert';

import 'package:doantotnghiep/src/config.dart';
import 'package:doantotnghiep/src/modules/authen/dtos/models/login_model.dart';
import 'package:doantotnghiep/src/modules/authen/dtos/models/modelshomepage/delete_profile_model.dart';
import 'package:doantotnghiep/src/modules/authen/dtos/models/profile_model.dart';
import 'package:doantotnghiep/src/modules/authen/dtos/models/signup_model.dart';
import 'package:doantotnghiep/src/modules/authen/dtos/request/login_request.dart';
import 'package:doantotnghiep/src/modules/authen/dtos/request/signup_request.dart';
import 'package:doantotnghiep/src/modules/authen/routes.dart';
import 'package:doantotnghiep/src/utilities/api/api_utility.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthenService {
  final _apiUtility = new ApiUtility();

  Future<LoginResponse?> login(LoginRequest request) async {
    LoginResponse responseData;
    final config = await AppConfig.forEnvironment();
    // lay url
    final urlLogin = "${config.host}/$LOGIN_URL";
    final response =
    await _apiUtility.post(urlLogin, body: jsonEncode(request));
    responseData = LoginResponse.fromJson(json.decode(response.body));
    print(responseData);
    return responseData;
  }

  Future<SignUpResponse?> register(SignUpRequest request) async {
    SignUpResponse responseData;
    final config = await AppConfig.forEnvironment();
    final urlRegister =
        "${config
        .host}/$SIGNUP_URL"; // Đảm bảo REGISTER_URL đã được định nghĩa trong routes.dart
    final response =
    await _apiUtility.post(urlRegister, body: jsonEncode(request));
    responseData = SignUpResponse.fromJson(json.decode(response.body));
    print(responseData);
    return responseData;
  }

//  return user;

  Future<ProfileResponse?> getProfile(int userId) async {
    try {
      final config = await AppConfig.forEnvironment(baseUser: true);
      //final url = "${config.host}/$PROFILE_URL?Id=3";
      final url = "${config.host}/$PROFILE_URL?Id=${userId}";
      final response = await _apiUtility.get(url);
      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        return ProfileResponse.fromJson(jsonResponse);
      } else {
        print("Failed to load profile");
        return null;
      }
    } catch (e) {
      print("Error: $e");
      return null;
    }
  }
  Future<DeleteAccountResponse?> deleteAccount(int userId) async {
    try {
      final config = await AppConfig.forEnvironment(baseUser: true);
      final url = "${config.host}/$DELETE_ACCOUNT_URL";
      final response = await _apiUtility.delete(url);
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        return DeleteAccountResponse.fromJson(responseData);
      } else {
        // Xử lý khi có lỗi từ server
        print("Failed to delete account. Status code: ${response.statusCode}");
        return null;
      }
    } catch (e) {
      // Xử lý khi có lỗi xảy ra trong quá trình xóa tài khoản
      print("Error deleting account: $e");
      return null;
    }
  }
}

