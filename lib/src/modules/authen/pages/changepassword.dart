import 'package:doantotnghiep/src/modules/authen/provider/authen_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChangePasswordScreen extends StatelessWidget {
  final TextEditingController _oldPasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final FocusNode _oldPasswordFocus = FocusNode();
  final FocusNode _newPasswordFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Đổi mật khẩu',
          style: TextStyle(
            color: Colors.white, // Màu chữ trắng
            fontSize: 20, // Kích thước chữ lớn hơn
            fontWeight: FontWeight.bold, // Chữ đậm
          ),
        ),
        centerTitle: true, // Căn giữa tiêu đề của AppBar
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              SizedBox(height: 20),
              Image.asset(
                'assets/images/pass.png',
                width: 150,
                height: 150,
              ),
              SizedBox(height: 20),
              TextField(
                controller: _oldPasswordController,
                focusNode: _oldPasswordFocus,
                decoration: InputDecoration(
                  labelText: 'Old Password',
                  fillColor: Colors.green[50],
                  filled: true,
                ),
                obscureText: true,
                onSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_newPasswordFocus);
                },
              ),
              SizedBox(height: 10),
              TextField(
                controller: _newPasswordController,
                focusNode: _newPasswordFocus,
                decoration: InputDecoration(
                  labelText: 'New Password',
                  fillColor: Colors.green[50],
                  filled: true,
                ),
                obscureText: true,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  final oldPassword = _oldPasswordController.text;
                  final newPassword = _newPasswordController.text;
                  context.read<AuthenProvider>().changePassword(context, oldPassword, newPassword);
                },
                child: Text(
                  'Change Password',
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
