import 'package:flutter/material.dart';

class PaymentSuccessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Thanh Toán Thành Công'),
        automaticallyImplyLeading: false, // Ẩn nút quay lại
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Icon(
              Icons.check_circle,
              color: Colors.green,
              size: 100.0,
            ),
            SizedBox(height: 24.0),
            Text(
              'Chúc Mừng!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Giao dịch của bạn đã hoàn tất thành công.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
            SizedBox(height: 32.0),
            Text(
              'Chi Tiết Giao Dịch',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            // Giả sử có chi tiết giao dịch trong đối tượng transactionDetails
            // Bạn có thể thay thế phần này với thông tin thực tế
            Text(
              'Mã Giao Dịch: 123456\nSố Tiền: 1.000.000 VND\nNgày: 17/05/2024',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            SizedBox(height: 32.0),
            ElevatedButton(
              onPressed: () {
                // Điều hướng quay lại trang chủ
                Navigator.of(context).pushNamedAndRemoveUntil(
                  '/home', // Thay thế với tên route trang chủ của bạn
                      (route) => false,
                );
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: Colors.blue, // Màu chữ của nút
                padding: EdgeInsets.symmetric(vertical: 16.0), // Padding bên trong nút
                textStyle: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              child: Text('Quay Lại Trang Chủ'),
            ),
          ],
        ),
      ),
    );
  }
}
