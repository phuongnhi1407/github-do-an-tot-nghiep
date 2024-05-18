// import 'package:flutter/material.dart';
// import 'package:webview_flutter/webview_flutter.dart';
//
// class PaymentWebView extends StatefulWidget {
//   final String paymentUrl;
//
//   PaymentWebView({required this.paymentUrl});
//
//   @override
//   _PaymentWebViewState createState() => _PaymentWebViewState();
// }
//
// class _PaymentWebViewState extends State<PaymentWebView> {
//   @override
//   void initState() {
//     super.initState();
//     // Enable hybrid composition for WebView on Android
//     if (WebView.platform == null) {
//       WebView.platform = SurfaceAndroidWebView();
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Trang thanh toán'),
//       ),
//       body: WebView(
//         initialUrl: widget.paymentUrl,
//         javascriptMode: JavaScriptMode.unrestricted,
//       ),
//     );
//   }
// }
