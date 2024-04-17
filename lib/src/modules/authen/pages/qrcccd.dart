import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ScanIDCardScreen extends StatefulWidget {
  @override
  _ScanIDCardScreenState createState() => _ScanIDCardScreenState();
}

class _ScanIDCardScreenState extends State<ScanIDCardScreen> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  late QRViewController controller;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quét Căn Cước Công Dân'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: QRView(
              key: qrKey,
              onQRViewCreated: _onQRViewCreated,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Đưa căn cước công dân vào khung quét để bắt đầu.',
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      // Handle the scanned ID card data
      print('Scanned ID card data: ${scanData.code}');
      // You can do whatever you want with the scanned ID card data here

      // Example: Navigator.pop(context, scanData.code); // Return the scanned data to previous screen
    });
  }
}