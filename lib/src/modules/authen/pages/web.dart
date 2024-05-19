import 'package:doantotnghiep/src/config.dart';
import 'package:doantotnghiep/src/modules/authen/pages/home.dart';
import 'package:doantotnghiep/src/modules/authen/pages/paymentsuccess.dart';
import 'package:doantotnghiep/src/utilities/api/api_utility.dart';
import 'package:doantotnghiep/src/widgets/toast/toast.dart';
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
        initialUrlRequest: URLRequest(url: WebUri(widget.urlWebPay)),
        onWebViewCreated: (InAppWebViewController controller) {
          webView = controller;
        },
        onLoadStop: (con, uri) async {
          print(uri);
        },
        onUpdateVisitedHistory: (controller, url, androidIsReload) async {
          int amoount =
              int.parse(url!.queryParameters['vpc_Amount'].toString());
          String vpc = url!.queryParameters['vpc_TxnResponseCode'].toString();
          String tradingCode =
              url!.queryParameters['vpc_MerchTxnRef'].toString();
          final config = await AppConfig.forEnvironment();

          if (url!.host == config.host!.replaceFirst("https://", "") &&
              vpc == 0.toString() &&
              // url.query.contains("vpc_TxnResponseCode") == 0.toString() &&
              url.path.contains("/payment-result-mobile")) {
            webView?.goBack();
            ToastCustom().showBottom(context,
                msg: "Thanh toán thành công", color: Colors.green);
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                  builder: (context) => PaymentSuccessScreen(
                        amount: amoount,
                        codeTrading: tradingCode,
                      )),
              (Route<dynamic> route) => false,
            );

            return;
          } else {
            ToastCustom()
                .showBottom(context, msg: "Thanh toán lỗi", color: Colors.red);
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
              (Route<dynamic> route) => false,
            );
          }
        },
      ),
    );
  }
}
