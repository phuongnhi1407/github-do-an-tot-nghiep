// import 'package:doantotnghiep/src/modules/authen/dtos/models/news_model.dart';
// import 'package:doantotnghiep/src/modules/authen/dtos/models/notificationlist_model.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:doantotnghiep/src/modules/authen/provider/authen_provider.dart';
//
// class NotificationScreen extends StatefulWidget {
//   const NotificationScreen({Key? key}) : super(key: key);
//
//   @override
//   State<NotificationScreen> createState() => _NotificationScreenState();
// }
//
// class _NotificationScreenState extends State<NotificationScreen> {
//   @override
//   void initState() {
//     super.initState();
//     // Gọi phương thức để lấy tin tức khi màn hình được khởi tạo
//     Provider.of<AuthenProvider>(context, listen: false).fetchNoti(context);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text('Danh sách thông báo'),
//         ),
//         body: Consumer<AuthenProvider>(
//           builder: (context, authenProvider, _) {
//             // Nếu isLoadingNews là true, hiển thị widget CircularProgressIndicator
//             if (authenProvider.isLoading) {
//               return Center(
//                 child: CircularProgressIndicator(),
//               );
//             }
//             // Nếu không có tin tức hoặc có lỗi, hiển thị thông báo
//             else if (authenProvider.notificationList == null) {
//               return Center(
//                 child: Text('No news available'),
//               );
//             }
//             // Nếu có tin tức, hiển thị thông tin tin tức
//             else {
//               return _buildNewsInfo(authenProvider.notificationList as NotificationData);
//             }
//           },
//         ),
//       ),
//     );
//   }
//
//   // Phương thức để xây dựng giao diện hiển thị thông tin tin tức
//   Widget _buildNewsInfo(NotificationData notificationList) {
//     return SingleChildScrollView(
//       padding: EdgeInsets.all(16),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // Hiển thị tiêu đề tin tức
//           Text(
//             notificationList.title ?? '',
//             style: TextStyle(
//               fontSize: 24,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           SizedBox(height: 16),
//           // Hiển thị hình ảnh tin tức (nếu có)
//
//           SizedBox(height: 16),
//           // Hiển thị nội dung tin tức
//           //Text(newsInfo.content ?? ''),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:doantotnghiep/src/modules/authen/provider/authen_provider.dart';
import 'package:doantotnghiep/src/modules/authen/dtos/models/notificationlist_model.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authenProvider = Provider.of<AuthenProvider>(context);

    // Gọi phương thức fetchNotification để lấy thông báo từ API
    authenProvider.fetchNoti(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Danh sách thông báo'),
      ),
      body: authenProvider.isLoading
          ? Center(
        child: CircularProgressIndicator(),
      )
          : authenProvider.notificationList != null
          ? ListView.builder(
        itemCount: authenProvider.notificationList!.length,
        itemBuilder: (context, index) {
          final NotificationData notification =
          authenProvider.notificationList![index];
          return ListTile(
            title: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 50,
                  height: 50,
                  child: notification.image != null
                      ? Image.network(
                    notification.image!,
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  )
                      : Container(),
                ),
                SizedBox(width: 10), // Khoảng cách giữa ảnh và title
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        notification.title ?? '',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5), // Khoảng cách giữa title và content
                      Text(notification.content ?? ''),

                      SizedBox(height: 5), // Khoảng cách giữa title và content
                      Text(notification.createdDate ?? ''),
                    ],
                  ),
                ),
              ],
            ),
            //subtitle: Text(notification.createdDate ?? ''),
            onTap: () {
              // Xử lý khi người dùng chọn một thông báo cụ thể
              // Ví dụ: mở chi tiết thông báo
            },
          );
        },
      )
          : Center(
        child: Text(authenProvider.errorMessage ??
            'Không có thông báo'),
      ),
    );
  }
}


