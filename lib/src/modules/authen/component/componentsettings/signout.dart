import 'package:doantotnghiep/src/modules/authen/pages/login.dart';
import 'package:flutter/material.dart';

class SignoutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Đăng xuất'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Thực hiện đăng xuất khi người dùng nhấn nút
            // Xóa thông tin đăng nhập của người dùng và điều hướng đến màn hình đăng nhập
            _logout(context);
          },
          child: Text('Logout'),
        ),
      ),
    );
  }

  void _logout(BuildContext context) {
    // Xóa thông tin đăng nhập của người dùng
    // Ví dụ: clearToken(), clearUserData()

    // Điều hướng đến màn hình đăng nhập hoặc màn hình chính của ứng dụng
    Navigator.push(context, MaterialPageRoute(builder: (context)=> const LoginScreen()));
  }
}