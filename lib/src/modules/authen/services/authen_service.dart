import 'dart:convert';
import 'package:doantotnghiep/src/config.dart';
import 'package:doantotnghiep/src/modules/authen/dtos/models/bakingtransaction_model.dart';
import 'package:doantotnghiep/src/modules/authen/dtos/models/changepassword_model.dart';
import 'package:doantotnghiep/src/modules/authen/dtos/models/login_model.dart';
import 'package:doantotnghiep/src/modules/authen/dtos/models/delete_profile_model.dart';
import 'package:doantotnghiep/src/modules/authen/dtos/models/mywallet_model.dart';
import 'package:doantotnghiep/src/modules/authen/dtos/models/news_model.dart';
import 'package:doantotnghiep/src/modules/authen/dtos/models/notificationlist_model.dart';
import 'package:doantotnghiep/src/modules/authen/dtos/models/profile_model.dart';
import 'package:doantotnghiep/src/modules/authen/dtos/models/recharge_model.dart';
import 'package:doantotnghiep/src/modules/authen/dtos/models/signout_model.dart';
import 'package:doantotnghiep/src/modules/authen/dtos/models/signup_model.dart';
import 'package:doantotnghiep/src/modules/authen/dtos/models/station_model.dart';
import 'package:doantotnghiep/src/modules/authen/dtos/models/transactionhistory_model.dart';
import 'package:doantotnghiep/src/modules/authen/dtos/request/bakingtransaction_request.dart';
import 'package:doantotnghiep/src/modules/authen/dtos/request/login_request.dart';
import 'package:doantotnghiep/src/modules/authen/dtos/request/recharge_request.dart';
import 'package:doantotnghiep/src/modules/authen/dtos/request/signup_request.dart';
import 'package:doantotnghiep/src/modules/authen/dtos/request/station_request.dart';
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



  //CHI TIẾT THÔNG BÁO VÀ TIN TỨC
  Future<NewsResponse?> getNews(int notificationId) async {
    try {
      final config = await AppConfig.forEnvironment(baseUser: true);
      //final url = "${config.host}/$NEWS_URL?NotificationId=$notificationId";
      final url = "${config.host}/$NEWS_URL?NotificationId=1";
      final response = await _apiUtility.get(url); // Gửi yêu cầu GET đến máy chủ
      if (response != null && response.statusCode == 200) {
        // Nếu phản hồi thành công và không null
        final jsonResponse = json.decode(response.body);
        return NewsResponse.fromJson(jsonResponse); // Trả về đối tượng NewsResponse từ dữ liệu JSON
      } else {
        print("Error fetching news: ${response?.statusCode}");
        return null;
      }
    } catch (e) {
      print("Error fetching news: $e");
      return null;
    }
  }

  //THÔNG BÁO VÀ TIN TỨC
  Future<NotificationResponse?> getNotification(int userId) async {
    try {
      final config = await AppConfig.forEnvironment(baseUser: true);
      final url = "${config.host}/$NOTIFICATIONLIST_URL?UserId=${userId}";
      final response = await _apiUtility.get(url);

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        return NotificationResponse.fromJson(jsonResponse);
      } else {
        print("Failed to fetch notifications");
        return null;
      }
    } catch (e) {
      print("Error: $e");
      return null;
    }
  }

  //NẠP TIỀN
  Future<Baking?> gettBaking(BakingRequest request) async {
    Baking? resData; // Đổi kiểu dữ liệu sang Baking? (nullable)
    final config = await AppConfig.forEnvironment(baseUser: true);
    final urlbaking = "${config.host}/$BAKINGTRASACTION_URL";
    final response = await _apiUtility.post(urlbaking, body: jsonEncode(request));
    resData = Baking.fromJson(json.decode(response.body));
    print(resData);
    return resData;

  }


  //NẠP TIỀN
  Future<Baking?> getbaking(BakingRequest request) async {
    try {
      final config = await AppConfig.forEnvironment(baseUser: true);
      final urlbaking = "${config.host}/$BAKINGTRASACTION_URL";
      final response = await _apiUtility.post(urlbaking, body: jsonEncode(request));

      if (response.statusCode == 200) {
        if (response.body != null && response.body.isNotEmpty) {
          Baking responseData = Baking.fromJson(json.decode(response.body));
          print('Response data: $responseData');
          print('Transaction successful');
          return responseData;
        } else {
          print('Response body is empty');
        }
      } else {
        print('Transaction failed: ${response.statusCode}');
        // Xử lý lỗi khi giao dịch nạp tiền không thành công
        // Ví dụ: throw Exception('Transaction failed: ${response.statusCode}');
      }
    } catch (e) {
      // Xử lý exception nếu có lỗi xảy ra trong quá trình giao dịch
      print('Error: $e');
      // Ví dụ: throw Exception('Error: $e');
    }
    return null;
  }

  //LỊCH SỬ NẠP TIỀN
  Future<TransactionHistoryResponse?> getTransactionHistory(int userId) async {
    try {
      final config = await AppConfig.forEnvironment(baseUser: true);
      final url = "${config.host}/$TRANSACTIONHISTORY_URL?UserId=${userId}";
      final response = await _apiUtility.get(url);

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        return TransactionHistoryResponse.fromJson(jsonResponse);
      } else {
        print("Failed to fetch transaction history");
        return null;
      }
    } catch (e) {
      print("Error: $e");
      return null;
    }
  }

  //THAY ĐỔI MẬT KHẨU
  Future<ChangePasswordResponse?> changePassword(String oldPassword, String newPassword) async {
    try {
      final config = await AppConfig.forEnvironment();
      final url = "${config.host}/$CHANGEPASSWORD_URL";
      final body = {
        "passwordOld": oldPassword,
        "passwordNew": newPassword,
      };
      final response = await _apiUtility.put(url, body: jsonEncode(body));

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        return ChangePasswordResponse.fromJson(jsonResponse);
      } else {
        print("Failed to change password: ${response.statusCode}");
        return null;
      }
    } catch (e) {
      print("Error: $e");
      return null;
    }
  }

  //THÔNG TIN VÍ TIỀN
  Future<MyWalletResponse?> getMyWallet(int userId) async {
    try {
      final config = await AppConfig.forEnvironment(baseUser: true);
      //final url = "${config.host}/$PROFILE_URL?Id=3";
      final url = "${config.host}/$MYWALLET_URL?UserId=${userId}";
      final response = await _apiUtility.get(url);
      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        return MyWalletResponse.fromJson(jsonResponse);
      } else {
        print("Không tải được thông tin của bạn");
        return null;
      }
    } catch (e) {
      print("Error: $e");
      return null;
    }
  }

  Future<RechargeResponse?> recharge(RechargeRequest request) async {
    try {
      final config = await AppConfig.forEnvironment(baseUser: true);
      final urlRecharge = "${config.host}/$BAKINGTRASACTION_URL"; // Đảm bảo BAKINGTRASACTION_URL đã được định nghĩa trong routes.dart
      final response = await _apiUtility.post(urlRecharge, body: jsonEncode(request));

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        return RechargeResponse.fromJson(jsonResponse);
      } else {
        print('Failed to recharge: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Error during recharge: $e');
      return null;
    }
  }
//DANH SÁCH TRẠM XE
  Future<StationResponse?> getStation(StationRequest request) async {
    try {
      final config = await AppConfig.forEnvironment(baseUser: true);
      final url = "${config.host}/$STATION_URL";
      final response = await _apiUtility.get(url);

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        return StationResponse.fromJson(jsonResponse);
      } else {
        print("Failed to fetch transaction history");
        return null;
      }
    } catch (e) {
      print("Error: $e");
      return null;
    }
  }

}

