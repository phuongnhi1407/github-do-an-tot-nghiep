// //ĐĂNG KÝ
// Future<SignUpResponse?> register(SignUpRequest request) async {
//   SignUpResponse responseData;
//   final config = await AppConfig.forEnvironment(baseUser: true);
//   final urlRegister =
//       "${config.host}/$SIGNUP_URL"; // Đảm bảo REGISTER_URL đã được định nghĩa trong routes.dart
//   final response =
//   await _apiUtility.post(urlRegister, body: jsonEncode(request));
//   responseData = SignUpResponse.fromJson(json.decode(response.body));
//   print(responseData);
//   return responseData;
// }
// //ĐĂNG KÝ
// Future<void> fetchSignUp(BuildContext context, SignUpRequest request) async {
//   try {
//     final response = await _authenService.register(request);
//     if (response != null) {
//       if (response.statusCode == 200) {
//         ToastCustom().showBottom(context,
//             msg: "Đăng ký thành công", color: Colors.green);
//         Navigator.pushAndRemoveUntil(
//           context,
//           MaterialPageRoute(builder: (context) => LoginScreen()),
//               (Route<dynamic> route) => false,
//         );
//       } else {
//         ToastCustom().showBottom(context,
//             msg: "${json.decode(response.message.toString())[0]['value']}",
//             color: Colors.red);
//       }
//     }
//   } catch (error) {
//     print("Lỗi: $error");
//     // Hiển thị thông báo hoặc xử lý lỗi
//   }
// }