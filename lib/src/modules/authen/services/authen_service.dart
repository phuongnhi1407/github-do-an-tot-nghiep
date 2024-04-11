import 'dart:convert';

import 'package:doantotnghiep/src/config.dart';
import 'package:doantotnghiep/src/models/generality_response.dart';
import 'package:doantotnghiep/src/modules/authen/dtos/models/login_model.dart';
import 'package:doantotnghiep/src/modules/authen/dtos/models/user_model.dart';
import 'package:doantotnghiep/src/modules/authen/dtos/request/login_request.dart';
import 'package:doantotnghiep/src/modules/authen/routes.dart';
import 'package:doantotnghiep/src/utilities/api/api_utility.dart';

class AuthenService {
  final _apiUtility = new ApiUtility();
  Result? resultResponse;
  Future<LoginModel?> login(LoginRequest request) async {
    LoginModel responseData;
    final config = await AppConfig.forEnvironment();
    // lay url
    final urlLogin = "${config.host}/$LOGIN_URL";
    final response =
        await _apiUtility.post(urlLogin, body: jsonEncode(request));

    responseData = LoginModel.fromJson(json.decode(response.body)['data']);

    return responseData;
  }
  //  return user;
}
// model view --> xu ly logic code 
