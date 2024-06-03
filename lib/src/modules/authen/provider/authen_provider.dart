import 'dart:convert';
import 'package:doantotnghiep/src/modules/authen/dtos/models/detailstation_model.dart';
import 'package:doantotnghiep/src/modules/authen/dtos/models/listbikeinstation_model.dart';
import 'package:doantotnghiep/src/modules/authen/dtos/models/listnews_model.dart';
import 'package:doantotnghiep/src/modules/authen/dtos/models/mywallet_model.dart';
import 'package:doantotnghiep/src/modules/authen/dtos/models/notificationlist_model.dart';
import 'package:doantotnghiep/src/modules/authen/dtos/models/profile_model.dart';
import 'package:doantotnghiep/src/modules/authen/dtos/models/recharge_model.dart';
import 'package:doantotnghiep/src/modules/authen/dtos/models/signout_model.dart';
import 'package:doantotnghiep/src/modules/authen/dtos/models/station_model.dart';
import 'package:doantotnghiep/src/modules/authen/dtos/models/transactionhistory_model.dart';
import 'package:doantotnghiep/src/modules/authen/dtos/request/bakingtransaction_request.dart';
import 'package:doantotnghiep/src/modules/authen/dtos/request/changepass_request.dart';
import 'package:doantotnghiep/src/modules/authen/dtos/request/fogotpass_request.dart';
import 'package:doantotnghiep/src/modules/authen/dtos/request/listbikestation_request.dart';
import 'package:doantotnghiep/src/modules/authen/dtos/request/recharge_request.dart';
import 'package:doantotnghiep/src/modules/authen/dtos/request/signup_request.dart';
import 'package:doantotnghiep/src/modules/authen/dtos/request/station_request.dart';
import 'package:doantotnghiep/src/modules/authen/pages/tutorial.dart';
import 'package:doantotnghiep/src/modules/authen/pages/login.dart';
import 'package:doantotnghiep/src/modules/authen/pages/web.dart';
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

  //thongtintram
  StationDetailData? dataInfo;
  bool isLoadingStationDetail = false;

  //thongbao
  List<NotificationData>? notificationList; //dstbao
  bool isLoading = false;
  String? errorMessage;
//tin tức
  List<ListNewsData>? listnewsList; //dstbao
  bool isLoadinglistnews = false;
  String? errorMessagelistnews;
  //tintuc
  bool isLoadingNews = false;

  //naptien
  bool _isLoadingRecharge = false;
  bool get isLoadingRecharge => _isLoadingRecharge;

  //lichsunaptien
  bool isLoadingHistory = false;
  List<TransactionHistoryData>? transactionhistoryList; //dslsnt

  //thay đổi mật khẩu
  bool isLoadingChangePassword = false;
  String? errorMessageChangePassword;

  //vitien
  MyWalletData? walletInfo;
  bool isLoadingWallet = false;

  //ds tram
  bool isLoadingStation = false;
  List<StationData>? stationList; //dslsnt

  List<StationData>? stationnList = [];
  String errorrMessage = '';
  bool isLoadingStationn = true;
  //ds chi tiết xe
  bool isLoadingStationBike = false;
  List<ListBikeData>? stationListBike; //dslsnt

  List<ListBikeData>? stationnListBike = [];
  String errorrMessageBike = '';
  bool isLoadingStationnBike = true;
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
      ToastCustom().showBottom(context, msg: "Lỗi: $error", color: Colors.red);
    }
    notifyListeners();
  }

  // //XÓA TÀI KHOẢN
  // Future<void> fetchDeleteAccount(BuildContext context) async {
  //   try {
  //     final SharedPreferences prefs = await SharedPreferences.getInstance();
  //     int userId = prefs.getInt("userId")!;
  //
  //     final response = await _authenService.deleteAccount(userId);
  //     if (response != null) {
  //       if (response.statusCode == 200) {
  //         // Xóa tài khoản thành công
  //         ToastCustom().showBottom(context,
  //             msg: "Xóa tài khoản thành công", color: Colors.green);
  //         Navigator.pushAndRemoveUntil(
  //           context,
  //           MaterialPageRoute(builder: (context) => LoginScreen()),
  //               (Route<dynamic> route) => false,
  //         );
  //         return; // Kết thúc hàm sau khi thực hiện chuyển hướng
  //       } else {
  //         // Xử lý lỗi từ phản hồi
  //         print("Error deleting account. Status code: ${response.statusCode}");
  //         // Hiển thị thông báo hoặc thực hiện các hành động khác tùy thuộc vào yêu cầu của bạn
  //       }
  //     } else {
  //       // Xử lý khi response là null
  //       print("Error deleting account: Null response");
  //       // Hiển thị thông báo hoặc thực hiện các hành động khác tùy thuộc vào yêu cầu của bạn
  //     }
  //   } catch (error) {
  //     // Xử lý lỗi nếu có
  //     print("Error deleting account: $error");
  //     // Hiển thị thông báo hoặc thực hiện các hành động khác tùy thuộc vào yêu cầu của bạn
  //   }
  // }

  //ĐĂNG XUẤT
  Future<SignoutResponse?> fetchLogoutAccount(BuildContext context) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      int userId = prefs.getInt("userId")!.toInt();

      final response = await _authenService.logout(userId);

      if (response != null) {
        if (response is SignoutResponse) {
          if (response.statusCode == 200) {
            prefs.setString("token", "");
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
      ToastCustom().showBottom(context, msg: "Lỗi: $error", color: Colors.red);
    }
    notifyListeners();
  }
//Tin tức sự kiện
  Future<void> fetchlistnews(BuildContext context) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    userInfo = null;
    isLoadinglistnews = true;
    errorMessagelistnews = null;
    try {
      final listnewsResponse = await _authenService.getListNews();
      if (listnewsResponse != null) {
        if (listnewsResponse.statusCode == 200) {
          listnewsList = listnewsResponse.data;
          // Hiển thị thông tin cá nhân hoặc làm gì đó với dữ liệu đã nhận được
        } else {
          // Xử lý lỗi nếu có
          ToastCustom().showBottom(context,
              msg: "Lỗi: ${listnewsResponse.message}", color: Colors.red);
        }
        isLoadinglistnews = false;
      } else {
        // Xử lý lỗi khi response là null
        ToastCustom().showBottom(context,
            msg: "Lỗi: Không nhận được dữ liệu từ máy chủ", color: Colors.red);
      }
    } catch (error) {
      isLoadinglistnews = false;
      // Xử lý lỗi nếu có
      print("Lỗi: $error");
      ToastCustom().showBottom(context, msg: "Lỗi: $error", color: Colors.red);
    }
    notifyListeners();
  }
  //NAP TIEN
  Future<void> fetchBakingTransaction(
      BuildContext context, BakingRequest request) async {
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
    isLoadingHistory = true;
    errorMessage = null;
    try {
      final transactionHistoryResponse =
          await _authenService.getTransactionHistory(userId);
      if (transactionHistoryResponse != null) {
        if (transactionHistoryResponse.statusCode == 200) {
          transactionhistoryList = transactionHistoryResponse.data;
          // Hiển thị thông tin cá nhân hoặc làm gì đó với dữ liệu đã nhận được
        } else {
          // Xử lý lỗi nếu có
          ToastCustom().showBottom(context,
              msg: "Lỗi: ${transactionHistoryResponse.message}",
              color: Colors.red);
        }
        isLoadingHistory = false;
      } else {
        // Xử lý lỗi khi response là null
        ToastCustom().showBottom(context,
            msg: "Lỗi: Không nhận được dữ liệu từ máy chủ", color: Colors.red);
      }
    } catch (error) {
      isLoadingHistory = false;
      // Xử lý lỗi nếu có
      print("Lỗi: $error");
      ToastCustom().showBottom(context, msg: "Lỗi: $error", color: Colors.red);
    }
    notifyListeners();
  }

//THAY ĐỔI MẬT KHẨU
  Future<void> changePassword(
      BuildContext context, String oldPassword, String newPassword) async {
    try {
      final request = ChangePasswordRequest(
          passwordOld: oldPassword, passwordNew: newPassword);
      final response = await _authenService.changePassword(request);

      if (response != null) {
        if (response.statusCode == 200) {
          ToastCustom()
              .showBottom(context, msg: response.message, color: Colors.green);
        } else if (response.statusCode == 400) {
          ToastCustom().showBottom(context,
              msg: 'Tài khoản hoặc mật khẩu không đúng!', color: Colors.red);
        } else {
          ToastCustom().showBottom(context,
              msg: response.message ?? 'Failed to change password',
              color: Colors.red);
        }
      }
      // else {
      //   ToastCustom().showBottom(context,
      //       msg: 'Failed to change password', color: Colors.red);
      // }
    } catch (e) {
      print("Error: $e"); // Print the error for debugging purposes
      ToastCustom().showBottom(context,
          msg: 'Failed to change password 1', color: Colors.red);
    }
  }
//QUÊN MẬT KHẨU
  Future<void> forgotPassword(
      BuildContext context, String username, String email) async {
    try {
      final request = ForgotPasswordRequest(
          username: username, email: email);
      final response = await _authenService.forgotPassword(request);

      if (response != null) {
        if (response.statusCode == 200) {
          ToastCustom()
              .showBottom(context, msg: response.message, color: Colors.green);
        } else if (response.statusCode == 400) {
          ToastCustom().showBottom(context,
              msg: 'Tài khoản hoặc mật khẩu không đúng!', color: Colors.red);
        } else {
          ToastCustom().showBottom(context,
              msg: response.message ?? 'Failed to change password',
              color: Colors.red);
        }
      }
    } catch (e) {
      print("Error: $e"); // Print the error for debugging purposes
      ToastCustom().showBottom(context,
          msg: 'Failed to change password 1', color: Colors.red);
    }
  }
  // Future<void> performRecharge(
  //     BuildContext context, RechargeRequest request) async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   try {
  //     _isLoadingRecharge = true;
  //     notifyListeners();
  //
  //     final response = await _authenService.recharge(request);
  //     if (response != null) {
  //       if (response.statusCode == 200) {
  //         // Handle successful recharge
  //         ToastCustom().showBottom(context,
  //             msg: "Giao dịch nạp tiền thành công", color: Colors.green);
  //         // Perform any necessary actions after successful recharge
  //       } else {
  //         // Handle error
  //         print("Failed to recharge: ${response.statusCode}");
  //         // Show toast or alert with error message
  //       }
  //     } else {
  //       // Handle null response
  //       print("Error: Null response");
  //       // Show toast or alert with error message
  //     }
  //
  //     _isLoadingRecharge = false;
  //     notifyListeners();
  //   } catch (error) {
  //     // Handle error
  //     print("Error during recharge: $error");
  //     // Show toast or alert with error message
  //     _isLoadingRecharge = false;
  //     notifyListeners();
  //   }
  // }

  //HIỂN THỊ DANH SÁCH TRẠM XE VÀ TÌM KIẾM TRẠM XE
  Future<void> fetchStation(BuildContext context) async {
    try {
      final StationRequest request =
          StationRequest(); // Tạo đối tượng StationRequest
      // Gửi yêu cầu lấy danh sách trạm đến AuthenService và nhận phản hồi
      final StationResponse? stationResponse =
          await _authenService.getStation(request);

      if (stationResponse != null) {
        if (stationResponse.statusCode == 200) {
          // Lấy danh sách trạm từ phản hồi và cập nhật trạng thái của Provider
          stationList = stationResponse.data;
          // Thông báo cho các widget nghe Provider biết rằng dữ liệu đã thay đổi
          notifyListeners();
        } else {
          // Xử lý lỗi từ phản hồi
          errorMessage = "Lỗi: ${stationResponse.message}";
          print(errorMessage);
        }
      } else {
        // Xử lý khi không nhận được phản hồi
        errorMessage = "Lỗi: Không nhận được dữ liệu từ máy chủ";
        print(errorMessage);
      }
    } catch (error) {
      // Xử lý ngoại lệ
      errorMessage = "Lỗi: $error";
      print(errorMessage);
    } finally {
      isLoadingStation = false; // Dừng hiển thị biểu tượng tải
      notifyListeners();
    }
  }

  //HIỂN THỊ TRẠM TRÊN BẢN ĐỒ
  Future<void> fetchStationn() async {
    try {
      final StationRequest request = StationRequest();
      final StationResponse? stationResponse =
          await _authenService.getStation(request);

      if (stationResponse != null) {
        if (stationResponse.statusCode == 200) {
          stationnList = stationResponse.data;
          notifyListeners();
        } else {
          errorrMessage = "Lỗi: ${stationResponse.message}";
          print(errorrMessage);
        }
      } else {
        errorrMessage = "Lỗi: Không nhận được dữ liệu từ máy chủ";
        print(errorrMessage);
      }
    } catch (error) {
      errorrMessage = "Lỗi: $error";
      print(errorrMessage);
    } finally {
      isLoadingStationn = false;
      notifyListeners();
    }
  }

  //HIỂN THỊ THÔNG TIN CHI TIẾT XE
  Future<void> fetchStationBike(BuildContext context, int stationId) async {
    try {
      final BikeStationRequest request =
          BikeStationRequest(); // Tạo đối tượng StationRequest
      // Gửi yêu cầu lấy danh sách trạm đến AuthenService và nhận phản hồi
      final ListBikeResponse? bikestationResponse =
          await _authenService.getBikeStation(request);

      if (bikestationResponse != null) {
        if (bikestationResponse.statusCode == 200) {
          // Lấy danh sách trạm từ phản hồi và cập nhật trạng thái của Provider
          stationListBike = bikestationResponse.data;
          // Thông báo cho các widget nghe Provider biết rằng dữ liệu đã thay đổi
          notifyListeners();
        } else {
          // Xử lý lỗi từ phản hồi
          errorMessage = "Lỗi: ${bikestationResponse.message}";
          print(errorMessage);
        }
      } else {
        // Xử lý khi không nhận được phản hồi
        errorMessage = "Lỗi: Không nhận được dữ liệu từ máy chủ";
        print(errorMessage);
      }
    } catch (error) {
      // Xử lý ngoại lệ
      errorMessage = "Lỗi: $error";
      print(errorMessage);
    } finally {
      isLoadingStationnBike = false; // Dừng hiển thị biểu tượng tải
      notifyListeners();
    }
  }

  Future<void> fetchRecharge(
      BuildContext context, RechargeRequest request) async {
    // "price": 0,
    // "amount": 0,
    // "discount": 0,
    // "totalPrice": 10000,
    // "returnUrl": "string",
    // "cardList": "string",
    // "redirect": "string",
    // "lang": "vi_VN",
    // "baseUrl": "string"

    try {
      final response = await _authenService.recharge(request);
      if (response != null) {
        if (response.statusCode == 200) {
          RechargeResponse _data = response;

          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => WebViewPayment(
                      urlWebPay: _data.data.toString(),
                    )),
          );
        } else {
          String errorMessage =
              response.message ?? "Không có thông báo lỗi từ máy chủ";
          ToastCustom()
              .showBottom(context, msg: errorMessage, color: Colors.red);
        }
      } else {
        ToastCustom().showBottom(context,
            msg: "Không nhận được phản hồi từ máy chủ", color: Colors.red);
      }
    } catch (error) {
      print("Lỗi: $error");
      ToastCustom().showBottom(context,
          msg: "Đã xảy ra lỗi trong quá trình thanh toán", color: Colors.red);
    }
  }

  //THÔNG TIN CHI TIẾT TRẠM
  Future<void> fetchDetailStation(BuildContext context) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    int stationId = prefs.getInt("stationId")!.toInt();
    dataInfo = null;
    isLoadingStationDetail = true;
    try {
      final response = await _authenService.getDetailStation(stationId);
      if (response != null) {
        if (response.statusCode == 200) {
          dataInfo = response.data;
          // Hiển thị thông tin cá nhân hoặc làm gì đó với dữ liệu đã nhận được
        } else {
          // Xử lý lỗi nếu có
          ToastCustom().showBottom(context,
              msg: "Lỗi: ${response.message}", color: Colors.red);
        }
        isLoadingStationDetail = false;
      } else {
        // Xử lý lỗi khi response là null
        ToastCustom().showBottom(context,
            msg: "Lỗi: Không nhận được dữ liệu từ máy chủ", color: Colors.red);
      }
    } catch (error) {
      isLoadingStationDetail = false;
      // Xử lý lỗi nếu có
      print("Lỗi: $error");
      ToastCustom().showBottom(context, msg: "Lỗi: $error", color: Colors.red);
    }
    notifyListeners();
  }

//THÔNG TIN VÍ TIỀN
  Future<void> fetchMyWallet(BuildContext context) async {
    walletInfo = null;
    isLoadingWallet = true;
    try {
      final response = await _authenService.getMyWallet();
      if (response != null) {
        if (response.statusCode == 200) {
          walletInfo = response.data;
        } else {
          ToastCustom().showBottom(context,
              msg: "Lỗi: ${response.message}", color: Colors.red);
        }
      } else {
        ToastCustom().showBottom(context,
            msg: "Lỗi: Không nhận được dữ liệu từ máy chủ", color: Colors.red);
      }
    } catch (error) {
      print("Lỗi: $error");
      ToastCustom().showBottom(context, msg: "Lỗi: $error", color: Colors.red);
    }
    isLoadingWallet = false;
    notifyListeners();
  }
}
