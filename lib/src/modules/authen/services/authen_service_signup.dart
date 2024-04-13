import 'dart:convert';
import 'package:doantotnghiep/src/config.dart';
import 'package:doantotnghiep/src/modules/authen/dtos/models/login_model.dart';
import 'package:doantotnghiep/src/modules/authen/dtos/models/signup_model.dart';
import 'package:doantotnghiep/src/modules/authen/dtos/request/login_request.dart';
import 'package:doantotnghiep/src/modules/authen/dtos/request/signup_request.dart';
import 'package:doantotnghiep/src/modules/authen/routes.dart';
import 'package:doantotnghiep/src/utilities/api/api_utility.dart';

class AuthenServiceSignup {
  final _apiUtility = new ApiUtility();

  Future<LoginResponse?> login(LoginRequest request) async {
    // Phương thức login hiện có
  }

  Future<SignUpResponse?> register(SignUpRequest request) async {
    SignUpResponse responseData;
    final config = await AppConfig.forEnvironment();
    final urlRegister = "${config.host}/$SIGNUP_URL"; // Đảm bảo REGISTER_URL đã được định nghĩa trong routes.dart
    final response = await _apiUtility.post(urlRegister, body: jsonEncode(request));
    responseData = SignUpResponse.fromJson(json.decode(response.body));
    print(responseData);
    return responseData;
  }
}