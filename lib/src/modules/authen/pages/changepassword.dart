import 'package:doantotnghiep/src/modules/authen/provider/authen_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class ChangePasswordScreen extends StatelessWidget {
  final TextEditingController _oldPasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Change Password')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _oldPasswordController,
              decoration: InputDecoration(labelText: 'Old Password'),
              obscureText: true,
            ),
            TextField(
              controller: _newPasswordController,
              decoration: InputDecoration(labelText: 'New Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final oldPassword = _oldPasswordController.text;
                final newPassword = _newPasswordController.text;
                context.read<AuthenProvider>().changePassword(context, oldPassword, newPassword);
              },
              child: Text('Change Password'),
            ),
          ],
        ),
      ),
    );
  }
}
