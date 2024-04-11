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
//             flex: 4,
//             child: QRView(
//               key: _qrKey,
//               onQRViewCreated: _onQRViewCreated,
//             ),
//           ),
//           Expanded(
//             flex: 1,
//             child: Center(
//               child: Text('Align QR code within the frame to scan'),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   void _onQRViewCreated(QRViewController controller) {
//     this._controller = controller;
//     controller.scannedDataStream.listen((scanData) {
//       // Do something with the scan data
//       print('Scanned data: ${scanData.code}');
//     });
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
// }