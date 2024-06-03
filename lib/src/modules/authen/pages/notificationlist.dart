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
        backgroundColor: Colors.teal,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Danh sách thông báo',
          style: TextStyle(
            color: Colors.white, // Màu chữ trắng
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
          return Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 8.0, vertical: 4.0),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              elevation: 3,
              child: ListTile(
                leading: notification.image != null
                    ? ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    notification.image!,
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                )
                    : Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Icon(
                    Icons.image,
                    color: Colors.grey[700],
                  ),
                ),
                title: Text(
                  notification.title ?? '',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 5),
                    Text(notification.content ?? ''),
                    SizedBox(height: 5),
                    Text(
                      notification.createdDate ?? '',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                onTap: () {
                  // Xử lý khi người dùng chọn một thông báo cụ thể
                  // Ví dụ: mở chi tiết thông báo
                },
              ),
            ),
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