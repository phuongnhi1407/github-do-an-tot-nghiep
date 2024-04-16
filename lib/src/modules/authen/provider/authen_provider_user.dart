import 'package:doantotnghiep/src/modules/authen/dtos/models/profile_model.dart';
import 'package:doantotnghiep/src/modules/authen/services/authen_service_user.dart';
import 'package:flutter/material.dart';
import 'package:doantotnghiep/src/widgets/toast/toast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthenProviderUser extends ChangeNotifier {
  ProfileData? userInfo;
  AuthenServiceUser _authenServiceUser = AuthenServiceUser();

  Future<void> fetchProfile(BuildContext context) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      final response = await _authenServiceUser.getProfile();
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
}