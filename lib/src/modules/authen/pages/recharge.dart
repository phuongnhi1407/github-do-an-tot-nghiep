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
    authenProvider = Provider.of<AuthenProvider>(context, listen: false);
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
        backgroundColor: Colors.teal,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Thanh toán',
          style: TextStyle(
            color: Colors.white, // Màu chữ trắng
            fontSize: 20, // Kích thước chữ lớn hơn
            fontWeight: FontWeight.bold, // Chữ đậm
          ),
        ),
        centerTitle: true, // Căn giữa tiêu đề của AppBar
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Căn giữa các thành phần theo trục dọc
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 20),
              Image.asset(
                'assets/images/pay.png',
                width: 300, // Độ rộng của hình ảnh
                height: 300, // Độ cao của hình ảnh
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: TextField(
                  controller: _totalPriceController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Nhập số tiền',
                    prefixIcon: Icon(Icons.monetization_on),
                    border: OutlineInputBorder( // Border cho ô nhập liệu
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _handleRecharge,
                child: Text(
                  'Tiếp tục thanh toán',
                  style: TextStyle(color: Colors.white), // Màu chữ của nút
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green, // Màu nền của nút
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
