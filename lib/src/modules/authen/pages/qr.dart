// import 'package:flutter/material.dart';
// import 'package:qr_code_scanner/qr_code_scanner.dart';
//
// class QRScannerScreen extends StatefulWidget {
//   @override
//   _QRScannerScreenState createState() => _QRScannerScreenState();
// }
//
// class _QRScannerScreenState extends State<QRScannerScreen> {
//   late QRViewController _controller;
//   final GlobalKey _qrKey = GlobalKey(debugLabel: 'QR');
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('QR Scanner'),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: QRView(
//               key: _qrKey,
//               onQRViewCreated: _onQRViewCreated,
//             ),
//           ),
//           SizedBox(height: 16),
//           Text('Align QR code within the frame to scan'),
//         ],
//       ),
//     );
//   }
//
//   void _onQRViewCreated(QRViewController controller) {
//     this._controller = controller;
//     controller.scannedDataStream.listen((scanData) {
//       // Xử lý dữ liệu quét ở đây, ví dụ: gửi mã QR đến server để kiểm tra
//       String qrCode = scanData.code.toString(); // Chuyển đổi giá trị String? sang String
//       // Tiếp theo, bạn có thể gửi qrCode đến server để kiểm tra và xác nhận việc thuê xe đạp.
//     });
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
// }