// import 'package:flutter/material.dart';
// import 'package:qr_flutter/qr_flutter.dart';
//
// class QRCodeGenerator extends StatelessWidget {
//   final String data;
//
//   const QRCodeGenerator({Key? key, required this.data}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Container(
//         padding: EdgeInsets.all(20),
//         color: Colors.white,
//         child: QrImage(
//           data: data, // Pass the data parameter
//           version: QrVersions.auto, // Specify the QR code version
//           size: 200.0, // Specify the size of the QR code
//         ),
//       ),
//     );
//   }
// }