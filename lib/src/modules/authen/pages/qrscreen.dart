import 'dart:convert';

import 'package:doantotnghiep/src/modules/authen/dtos/models/qr_mode.dart';
import 'package:doantotnghiep/src/modules/authen/pages/rentalcarsuccess.dart';
import 'package:doantotnghiep/src/modules/authen/services/authen_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:doantotnghiep/src/modules/authen/pages/home.dart';

class Qrscreen extends StatefulWidget {
  const Qrscreen({super.key, required this.title});
  final String title;

  @override
  State<Qrscreen> createState() => _QrscreenState();
}

class _QrscreenState extends State<Qrscreen> {
  String _scanBarcodeResult = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Quét QR',
          style: TextStyle(
            color: Colors.white, // Màu chữ trắng
            fontSize: 20, // Kích thước chữ lớn hơn
            fontWeight: FontWeight.bold, // Chữ đậm
          ),
        ),
        centerTitle: true, // Căn giữa tiêu đề của AppBar
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: scnQR,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green, // Màu nền của nút
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  "Bắt đầu quét mã QR",
                  style: TextStyle(color: Colors.white), // Màu chữ của nút
                ),
              ),
              SizedBox(height: 20),
              Text(
                ' $_scanBarcodeResult',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  scnQR() async {
    String barcodeScanRes;
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          "#ff6666", "Hủy", true, ScanMode.QR);
      print(
          "Barcode Scan Result: $barcodeScanRes"); // Thêm dòng này để hiển thị giá trị của barcodeScanRes
      if (barcodeScanRes != '-1') {
        // Kiểm tra xem mã QR có đúng định dạng JSON hay không
        QrModel? getQR = await AuthenService().getQR(barcodeScanRes);
        if (getQR != null) {
          var bikeCode = getQR.bikeCode;
          var stationName = getQR.stationName;
          var location = getQR.location;
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => RentalSuccessScreen(
                bikeCode: bikeCode.toString(),
                stationName: stationName.toString(),
                location: location.toString(),
              ),
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Mã QR không hợp lệ"),
            ),
          );
        }
        // try {
        //   Map<String, dynamic> jsonData = json.decode(barcodeScanRes);
        //   var bikeCode = jsonData['bikeCode'];
        //   var stationName = jsonData['stationName'];
        //   var location = jsonData['location'];
        //   // Chuyển hướng đến RentalSuccessScreen khi quét thành công
        //   Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //       builder: (context) => RentalSuccessScreen(
        //         bikeCode: bikeCode,
        //         stationName: stationName,
        //         location: location,
        //       ),
        //     ),
        //   );
        // } catch (e) {
        //   // Nếu mã QR không phải là JSON, hiển thị thông báo lỗi
        //   ScaffoldMessenger.of(context).showSnackBar(
        //     SnackBar(
        //       content: Text("Mã QR không hợp lệ"),
        //     ),
        //   );
        // }
      }
    } on PlatformException {
      barcodeScanRes = "Không thể lấy thông tin nền tảng";
    }
    setState(() {
      _scanBarcodeResult = barcodeScanRes;
    });
  }
}

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
                // Điều hướng đến trang UnlockSuccessScreen khi mở khóa thành công
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UnlockSuccessScreen(),
                  ),
                );
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
