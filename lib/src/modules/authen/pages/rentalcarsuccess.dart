import 'package:flutter/material.dart';
import 'package:doantotnghiep/src/modules/authen/pages/home.dart';

class UnlockSuccessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mở khóa thành công'),
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
            SizedBox(height: 32.0),
            Text(
              'Xe đã được mở khóa thành công!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 32.0),
            ElevatedButton(
              onPressed: () {
                // Điều hướng quay lại trang chủ
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                      (Route<dynamic> route) => false,
                );
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.blue, // Màu chữ của nút
                padding: EdgeInsets.symmetric(
                  vertical: 16.0,
                ), // Padding bên trong nút
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
