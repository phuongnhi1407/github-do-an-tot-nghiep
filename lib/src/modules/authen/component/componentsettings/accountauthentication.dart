import 'package:flutter/material.dart';

class VerifyCCCDScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Xác thực CCCD'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Số CCCD'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Thực hiện xác thực khi người dùng nhấn nút
                verifyCCCD(context);
              },
              child: Text('Xác thực'),
            ),
          ],
        ),
      ),
    );
  }

  void verifyCCCD(BuildContext context) {
    // Thực hiện xác thực CCCD ở đây
    // Bạn có thể sử dụng một dịch vụ xác thực CCCD thực tế hoặc mô phỏng xác thực ở đây
    // Trong ví dụ này, chúng ta giả sử CCCD được xác thực thành công nếu người dùng nhập một số CCCD hợp lệ (không rỗng)
    final cccdNumber = '123456789'; // Thay thế bằng số CCCD mà người dùng nhập từ TextField

    if (cccdNumber.isNotEmpty) {
      // Nếu số CCCD không rỗng, hiển thị thông báo xác thực thành công
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Xác thực thành công'),
            content: Text('CCCD đã được xác thực thành công.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Đóng'),
              ),
            ],
          );
        },
      );
    } else {
      // Nếu số CCCD rỗng, hiển thị thông báo lỗi
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Lỗi'),
            content: Text('Vui lòng nhập số CCCD.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Đóng'),
              ),
            ],
          );
        },
      );
    }
  }
}