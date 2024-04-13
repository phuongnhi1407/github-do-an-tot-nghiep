import 'dart:convert';

import 'package:doantotnghiep/src/config.dart';
import 'package:doantotnghiep/src/modules/authen/dtos/models/login_model.dart';
import 'package:doantotnghiep/src/modules/authen/dtos/request/login_request.dart';
import 'package:doantotnghiep/src/modules/authen/routes.dart';
import 'package:doantotnghiep/src/utilities/api/api_utility.dart';

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
//  return user;
}