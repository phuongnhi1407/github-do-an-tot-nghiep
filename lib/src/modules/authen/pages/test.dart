// //THÔNG BÁO
// Future<void> fetchNoti(BuildContext context) async {
//   final SharedPreferences prefs = await SharedPreferences.getInstance();
//   int userId = prefs.getInt("userId")!.toInt();
//   userInfo = null;
//   isLoading = true;
//   errorMessage = null;
//   try {
//     final notificationResponse = await _authenService.getNotification(userId);
//     if (notificationResponse != null) {
//       if (notificationResponse.statusCode == 200) {
//         notificationList = notificationResponse.data;
//         // Hiển thị thông tin cá nhân hoặc làm gì đó với dữ liệu đã nhận được
//       } else {
//         // Xử lý lỗi nếu có
//         ToastCustom().showBottom(context,
//             msg: "Lỗi: ${notificationResponse.message}", color: Colors.red);
//       }
//       isLoading = false;
//     } else {
//       // Xử lý lỗi khi response là null
//       ToastCustom().showBottom(context,
//           msg: "Lỗi: Không nhận được dữ liệu từ máy chủ", color: Colors.red);
//     }
//   } catch (error) {
//     isLoading = false;
//     // Xử lý lỗi nếu có
//     print("Lỗi: $error");
//     ToastCustom().showBottom(context, msg: "Lỗi: $error", color: Colors.red);
//   }
//   notifyListeners();
// }