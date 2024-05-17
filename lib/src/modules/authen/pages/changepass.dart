// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:doantotnghiep/src/modules/authen/provider/authen_provider.dart';
//
// class ChangePasswordScreen extends StatefulWidget {
//   @override
//   _ChangePasswordScreenState createState() => _ChangePasswordScreenState();
// }
//
// class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
//   final _formKey = GlobalKey<FormState>();
//   final _oldPasswordController = TextEditingController();
//   final _newPasswordController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     final authenProvider = Provider.of<AuthenProvider>(context);
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Đổi mật khẩu'),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             children: [
//               TextFormField(
//                 controller: _oldPasswordController,
//                 decoration: InputDecoration(labelText: 'Mật khẩu cũ'),
//                 obscureText: true,
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Vui lòng nhập mật khẩu cũ';
//                   }
//                   return null;
//                 },
//               ),
//               TextFormField(
//                 controller: _newPasswordController,
//                 decoration: InputDecoration(labelText: 'Mật khẩu mới'),
//                 obscureText: true,
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Vui lòng nhập mật khẩu mới';
//                   }
//                   return null;
//                 },
//               ),
//               SizedBox(height: 20),
//               authenProvider.isLoadingChangePassword
//                   ? CircularProgressIndicator()
//                   : ElevatedButton(
//                 onPressed: () {
//                   if (_formKey.currentState?.validate() ?? false) {
//                     authenProvider.changePassword(
//                       _oldPasswordController.text,
//                       _newPasswordController.text,
//                     );
//                   }
//                 },
//                 child: Text('Đổi mật khẩu'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
