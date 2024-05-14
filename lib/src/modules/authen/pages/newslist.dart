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
        backgroundColor: Colors.lightGreen,
        title: Text(
          'Thông báo',
          style: TextStyle(
            color: Colors.black, // Màu chữ đen
            fontSize: 20, // Kích thước chữ lớn hơn
            fontWeight: FontWeight.bold, // Chữ đậm
          ),
        ),
        centerTitle: true, // Căn giữa tiêu đề của AppBar
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


