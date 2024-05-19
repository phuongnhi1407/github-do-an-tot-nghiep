import 'package:doantotnghiep/src/config.dart';
import 'package:doantotnghiep/src/modules/authen/pages/paymentsuccess.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class WebViewPayment extends StatefulWidget {
  const WebViewPayment({super.key, required this.urlWebPay});
  final String urlWebPay;

  @override
  State<WebViewPayment> createState() => _WebViewPaymentState();
}

class _WebViewPaymentState extends State<WebViewPayment> {
  late InAppWebViewController webView;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Thanh toán'),
      ),
      body: InAppWebView(
        initialUrlRequest: URLRequest(
            url: WebUri(widget.urlWebPay)

        ),
        onWebViewCreated: (InAppWebViewController controller) {
          webView = controller;
        },
        onLoadStop: (con, uri) async {
          print(uri);

    },
        onUpdateVisitedHistory:
            (controller, url, androidIsReload) async {
          final config = await AppConfig.forEnvironment();

          if (url!.host == config.host!.replaceFirst("https://", "") && url.query.contains("vpc_TxnResponseCode") == 0.toString() &&
              url.path.contains("/payment-result-mobile")) {
            //webView?.goBack();

            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => PaymentSuccessScreen()),
                  (Route<dynamic> route) => false,
            );

              return;
            }
        },


      ),

    );
  }
}
