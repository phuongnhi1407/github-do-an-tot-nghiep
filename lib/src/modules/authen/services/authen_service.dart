import 'dart:convert';
import 'package:doantotnghiep/src/config.dart';
import 'package:doantotnghiep/src/modules/authen/dtos/models/login_model.dart';
import 'package:doantotnghiep/src/modules/authen/dtos/models/delete_profile_model.dart';
import 'package:doantotnghiep/src/modules/authen/dtos/models/news_model.dart';
import 'package:doantotnghiep/src/modules/authen/dtos/models/profile_model.dart';
import 'package:doantotnghiep/src/modules/authen/dtos/models/signout_model.dart';
import 'package:doantotnghiep/src/modules/authen/dtos/models/signup_model.dart';
import 'package:doantotnghiep/src/modules/authen/dtos/request/login_request.dart';
import 'package:doantotnghiep/src/modules/authen/dtos/request/signup_request.dart';
import 'package:doantotnghiep/src/modules/authen/routes.dart';
import 'package:doantotnghiep/src/utilities/api/api_utility.dart';


class AuthenService {
  final _apiUtility = new ApiUtility();


  //ĐĂNG NHẬP
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


  //ĐĂNG KÝ
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


  //THÔNG TIN CÁ NHÂN
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
        print("Không tải được thông tin của bạn");
        return null;
      }
    } catch (e) {
      print("Error: $e");
      return null;
    }
  }


  //XÓA TÀI KHOẢN
  Future<DeleteResponse?> deleteAccount(int userId) async {
    try {
      final config = await AppConfig.forEnvironment(baseUser: true);
      final url = "${config.host}/$DELETE_ACCOUNT_URL";
      final response = await _apiUtility.delete(url, body: jsonEncode({"id": userId, "isSuperAdmin": true}));
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        return DeleteResponse.fromJson(responseData);
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


  //ĐĂNG XUẤT
  Future<SignoutResponse?> logout(int userId) async {
    try {
      final config = await AppConfig.forEnvironment();
      final url = "${config.host}/$LOGOUT_URL";
      final body = jsonEncode({"id": userId});

      final response = await _apiUtility.put(url, body: body);

      if (response != null && response.statusCode == 200) {
        final responseData = json.decode(response.body);
        if (responseData is Map<String, dynamic>) {
          return SignoutResponse.fromJson(responseData);
        } else {
          print("Error during logout: Unexpected response format");
          return null;
        }
      } else {
        // Xử lý khi có lỗi từ server hoặc response là null
        final errorMessage = response?.statusCode != null
            ? "Failed to logout. Status code: ${response.statusCode}"
            : "Null response";
        print(errorMessage);
        throw Exception(errorMessage);
      }
    } catch (e) {
      // Xử lý khi có lỗi xảy ra trong quá trình đăng xuất
      print("Error during logout: $e");
      throw Exception("Error during logout: $e");
    }
  }



  //THÔNG BÁO VÀ TIN TỨC
  Future<NewsModel?> getNews(int NotificationId) async {
    try {
      final config = await AppConfig.forEnvironment(baseUser: true);
      //final url = "${config.host}/$PROFILE_URL?Id=${userId}";
      final url = "${config.host}/$NEWS_URL?notificationId=${NotificationId}";
      final response = await _apiUtility.get(url);
      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        return NewsModel.fromJson(jsonResponse);
      } else {
        print("Không tải được tin tức của bạn");
        return null;
      }
    } catch (e) {
      print("Error: $e");
      return null;
    }
  }

}

