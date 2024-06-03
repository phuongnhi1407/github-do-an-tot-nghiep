import 'package:flutter/material.dart';
import 'package:doantotnghiep/src/modules/authen/pages/home.dart';

class RentalSuccessScreen extends StatelessWidget {
  const RentalSuccessScreen({
    Key? key,
    required this.bikeCode,
    required this.stationName,
    required this.location,
  }) : super(key: key);

  final String bikeCode;
  final String stationName;
  final String location;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Thuê xe'),
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
              'Chi Tiết Thuê Xe',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Mã Xe: $bikeCode\n'
                  'Tên Trạm: $stationName\n'
                  'Vị Trí: $location',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16.0,
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
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Xử lý logic mở khóa xe
                // Bạn có thể gọi API để thực hiện mở khóa xe
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.green, // Màu chữ của nút
                padding: EdgeInsets.symmetric(
                  vertical: 16.0,
                ), // Padding bên trong nút
                textStyle: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              child: Text('Mở khóa'),
            ),
          ],
        ),
      ),
    );
  }
}
