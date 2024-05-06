import 'dart:convert';
import 'package:doantotnghiep/src/modules/authen/dtos/models/notificationlist_model.dart';
import 'package:doantotnghiep/src/modules/authen/dtos/models/profile_model.dart';
import 'package:doantotnghiep/src/modules/authen/dtos/models/signout_model.dart';
import 'package:doantotnghiep/src/modules/authen/dtos/models/transactionhistory_model.dart';
import 'package:doantotnghiep/src/modules/authen/dtos/request/bakingtransaction_request.dart';
import 'package:doantotnghiep/src/modules/authen/dtos/request/signup_request.dart';
import 'package:doantotnghiep/src/modules/authen/pages/tutorial.dart';
import 'package:doantotnghiep/src/modules/authen/pages/login.dart';
import 'package:doantotnghiep/src/widgets/toast/toast.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:doantotnghiep/src/modules/authen/dtos/models/login_model.dart';
import 'package:doantotnghiep/src/modules/authen/dtos/request/login_request.dart';
import 'package:doantotnghiep/src/modules/authen/pages/home.dart';
import 'package:doantotnghiep/src/modules/authen/services/authen_service.dart';

class AuthenProvider extends ChangeNotifier {
  AuthenService _authenService = AuthenService();

  //dangnhap
  LoginModel? user;

  //thongtincanhan
  ProfileData? userInfo;
  bool isLoadingUser = false;

  //thongbao
  List<NotificationData>? notificationList; //dstbao
  bool isLoading = false;
  String? errorMessage;

  //tintuc
  bool isLoadingNews = false;

  //naptien

  //lichsunaptien
  bool isLoadingHistory = false;
  List<TransactionHistoryData>? transactionhistoryList; //dslsnt

  //thay đổi mật khẩu
  bool isLoadingchagepass = false;


  String? errorMessagechangepass;



  //ĐĂNG NHẬP
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


  //ĐĂNG KÝ
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


  //THÔNG TIN CÁ NHÂN
  Future<void> fetchProfile(BuildContext context) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    int userId = prefs.getInt("userId")!.toInt();
    userInfo = null;
    isLoadingUser = true;
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
        isLoadingUser = false;
      } else {
        // Xử lý lỗi khi response là null
        ToastCustom().showBottom(context,
            msg: "Lỗi: Không nhận được dữ liệu từ máy chủ", color: Colors.red);
      }
    } catch (error) {
      isLoadingUser = false;
      // Xử lý lỗi nếu có
      print("Lỗi: $error");
      ToastCustom().showBottom(
          context, msg: "Lỗi: $error", color: Colors.red);
    }
    notifyListeners();
  }


  //XÓA TÀI KHOẢN
  Future<void> fetchDeleteAccount(BuildContext context) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      int userId = prefs.getInt("userId")!;

      final response = await _authenService.deleteAccount(userId);
      if (response != null) {
        if (response.statusCode == 200) {
          // Xóa tài khoản thành công
          ToastCustom().showBottom(context,
              msg: "Xóa tài khoản thành công", color: Colors.green);
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => LoginScreen()),
                (Route<dynamic> route) => false,
          );
          return; // Kết thúc hàm sau khi thực hiện chuyển hướng
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


  //ĐĂNG XUẤT
  Future<SignoutResponse?> fetchLogoutAccount(BuildContext context) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      int userId = prefs.getInt("userId")!.toInt();

      final response = await _authenService.logout(userId);

      if (response != null) {
        if (response is SignoutResponse) {
          if (response.statusCode == 200) {
            // Xử lý khi đăng xuất thành công
            ToastCustom().showBottom(context,
                msg: "Đăng xuất thành công", color: Colors.green);
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => LoginScreen()),
                  (Route<dynamic> route) => false,
            );
          } else {
            // Xử lý khi có lỗi từ phản hồi
            print("Error during logout. Status code: ${response.statusCode}");
            // Hiển thị thông báo hoặc thực hiện các hành động khác tùy thuộc vào yêu cầu của bạn
          }
        } else {
          // Xử lý trường hợp response không phải là một đối tượng LogoutResponse
          print("Error during logout: Unexpected response type");
        }
      } else {
        // Xử lý khi response là null
        print("Error during logout: Null response");
        // Hiển thị thông báo hoặc thực hiện các hành động khác tùy thuộc vào yêu cầu của bạn
      }
      return response;
    } catch (error) {
      // Xử lý lỗi nếu có
      print("Error during logout: $error");
      // Hiển thị thông báo hoặc thực hiện các hành động khác tùy thuộc vào yêu cầu của bạn
      return null;
    }
  }


  // //TIN TỨC VÀ THÔNG BÁO
  // // Phương thức để lấy tin tức từ máy chủ
  // Future<void> fetchNews(BuildContext context) async {
  //   try {
  //     // Hiển thị loading indicator
  //     isLoadingNews = true;
  //     notifyListeners();
  //
  //     // Lấy notificationId từ SharedPreferences (đã lưu ở nơi khác)
  //     final SharedPreferences prefs = await SharedPreferences.getInstance();
  //     int? notificationId = prefs.getInt("NotificationId");
  //
  //     // Gửi yêu cầu lấy tin tức đến AuthenService
  //     final response = await _authenService.getNews(notificationId ?? 0);
  //
  //     // Xử lý phản hồi từ AuthenService
  //     if (response != null) {
  //       if (response.statusCode == 200) {
  //         // Lưu thông tin tin tức vào newsInfo
  //         newsInfo = response.data;
  //         // Hiển thị thông tin tin tức hoặc thực hiện hành động phù hợp
  //       } else {
  //         // Xử lý khi có lỗi từ máy chủ
  //         print("Error fetching news: ${response.message}");
  //         // Hiển thị thông báo lỗi
  //         ToastCustom().showBottom(context, msg: "Error: ${response.message}", color: Colors.red);
  //       }
  //     } else {
  //       // Xử lý khi response là null
  //       print("Error fetching news: Null response");
  //       // Hiển thị thông báo lỗi
  //       ToastCustom().showBottom(context, msg: "Error: Null response", color: Colors.red);
  //     }
  //   } catch (error) {
  //     // Xử lý lỗi nếu có
  //     print("Error fetching news: $error");
  //     // Hiển thị thông báo lỗi
  //     ToastCustom().showBottom(context, msg: "Error: $error", color: Colors.red);
  //   }
  //
  //   // Tắt loading indicator sau khi kết thúc việc tải dữ liệu
  //   isLoadingNews = false;
  //   notifyListeners();
  // }


  // Future<void> fetchNotification(BuildContext context, int userId) async {
  //   isLoading = true;
  //   errorMessage = null;
  //   notifyListeners();
  //
  //   try {
  //     final notificationResponse = await _authenService.getNotification(userId);
  //     if (notificationResponse != null) {
  //       notificationList = notificationResponse.data;
  //     } else {
  //       errorMessage = "Failed to fetch notifications";
  //     }
  //   } catch (e) {
  //     errorMessage = "Error: $e";
  //   } finally {
  //     isLoading = false;
  //     notifyListeners();
  //   }
  // }


  //THÔNG BÁO
  Future<void> fetchNoti(BuildContext context) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    int userId = prefs.getInt("userId")!.toInt();
    userInfo = null;
    isLoading = true;
    errorMessage = null;
    try {
      final notificationResponse = await _authenService.getNotification(userId);
      if (notificationResponse != null) {
        if (notificationResponse.statusCode == 200) {
          notificationList = notificationResponse.data;
          // Hiển thị thông tin cá nhân hoặc làm gì đó với dữ liệu đã nhận được
        } else {
          // Xử lý lỗi nếu có
          ToastCustom().showBottom(context,
              msg: "Lỗi: ${notificationResponse.message}", color: Colors.red);
        }
        isLoading = false;
      } else {
        // Xử lý lỗi khi response là null
        ToastCustom().showBottom(context,
            msg: "Lỗi: Không nhận được dữ liệu từ máy chủ", color: Colors.red);
      }
    } catch (error) {
      isLoading = false;
      // Xử lý lỗi nếu có
      print("Lỗi: $error");
      ToastCustom().showBottom(
          context, msg: "Lỗi: $error", color: Colors.red);
    }
    notifyListeners();
  }


  //NAP TIEN
  Future<void> fetchBakingTransaction(BuildContext context, BakingRequest request) async {
    try {
      final response = await _authenService.getbaking(request);
      if (response != null) {
        if (response.statusCode == 200) {
          ToastCustom().showBottom(context,
              msg: "Giao dịch nạp tiền thành công", color: Colors.green);
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const TutorialPage()),
                (Route<dynamic> route) => false,
          );
        } else {
          // Xử lý khi giao dịch không thành công
          final errorMessage = response.message.toString();
          ToastCustom().showBottom(context,
              msg: "${json.decode(errorMessage)[0]['value']}",
              color: Colors.red);
        }
      } else {
        // Xử lý khi không nhận được phản hồi từ server
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Error"),
              content: Text("No response received from server"),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text("OK"),
                ),
              ],
            );
          },
        );
      }
    } catch (error) {
      print("Error: $error");
      // Hiển thị thông báo hoặc xử lý lỗi
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Error"),
            content: Text("An error occurred: $error"),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text("OK"),
              ),
            ],
          );
        },
      );
    }
  }



  //LỊCH SỬ NẠP TIỀN
  Future<void> fetchTransactionHistory(BuildContext context) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    int userId = prefs.getInt("userId")!.toInt();
    userInfo = null;
    isLoading = true;
    errorMessage = null;
    try {
      final TransactionHistoryResponse = await _authenService.getTransactionHistory(userId);
      if (TransactionHistoryResponse != null) {
        if (TransactionHistoryResponse.statusCode == 200) {
          transactionhistoryList = TransactionHistoryResponse.data;
          // Hiển thị thông tin cá nhân hoặc làm gì đó với dữ liệu đã nhận được
        } else {
          // Xử lý lỗi nếu có
          ToastCustom().showBottom(context,
              msg: "Lỗi: ${TransactionHistoryResponse.message}", color: Colors.red);
        }
        isLoading = false;
      } else {
        // Xử lý lỗi khi response là null
        ToastCustom().showBottom(context,
            msg: "Lỗi: Không nhận được dữ liệu từ máy chủ", color: Colors.red);
      }
    } catch (error) {
      isLoading = false;
      // Xử lý lỗi nếu có
      print("Lỗi: $error");
      ToastCustom().showBottom(
          context, msg: "Lỗi: $error", color: Colors.red);
    }
    notifyListeners();
  }

  //THAY ĐỔI MẬT KHẨU
  Future<void> changePassword(String oldPassword, String newPassword) async {
    try {
      isLoadingchagepass = true;
      notifyListeners();

      final response = await _authenService.changePassword(oldPassword, newPassword);

      if (response != null && response.statusCode == 200) {
        // Handle successful password change
        print("Password changed successfully");
      } else {
        // Handle failed password change
        errorMessagechangepass = "Failed to change password";
        print(errorMessagechangepass);
      }
    } catch (e) {
      // Handle error
      errorMessagechangepass = "Error: $e";
      print(errorMessagechangepass);
    } finally {
      isLoadingchagepass = false;
      notifyListeners();
    }
  }
}
