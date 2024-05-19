import 'package:doantotnghiep/src/modules/authen/dtos/request/recharge_request.dart';
import 'package:doantotnghiep/src/modules/authen/provider/authen_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final TextEditingController _totalPriceController = TextEditingController();
  final TextEditingController _langController = TextEditingController();

  AuthenProvider? authenProvider;

  @override
  void initState() {
    super.initState();
    authenProvider = Provider.of<AuthenProvider>(context, listen: false); // Khởi tạo AuthenProvider
  }

  void _handleRecharge() async {
    String totalPrice = _totalPriceController.text;
    String lang = _langController.text;

    RechargeRequest request = RechargeRequest(
      totalPrice: int.parse(totalPrice),
      lang: lang,
    );

    await authenProvider?.fetchRecharge(context, request);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Thanh toán'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 20),
            Icon(Icons.payment, color: Colors.blue, size: 100.0),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                controller: _totalPriceController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Nhập số tiền',
                  prefixIcon: Icon(Icons.monetization_on),
                ),
              ),
            ),

            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _handleRecharge,
              child: Text('Tiếp tục thanh toán'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Trở về màn hình trước đó khi người dùng nhấn nút
                Navigator.pop(context);
              },
              child: Text('Quay lại'),
            ),
          ],
        ),
      ),
    );
  }
}
