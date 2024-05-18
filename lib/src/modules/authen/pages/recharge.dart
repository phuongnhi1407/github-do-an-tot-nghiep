import 'package:flutter/material.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  TextEditingController _amountController = TextEditingController();
  TextEditingController _langController = TextEditingController();

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
                controller: _amountController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Nhập số tiền',
                  prefixIcon: Icon(Icons.monetization_on),
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                controller: _langController,
                decoration: InputDecoration(
                  labelText: 'Nhập ngôn ngữ (vi_VN)',
                  prefixIcon: Icon(Icons.language),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Lấy giá trị ngôn ngữ từ trường nhập liệu
                String lang = _langController.text;
                // Kiểm tra nếu ngôn ngữ là 'vi_VN' thì thực hiện thanh toán
                if (lang == 'vi_VN') {
                  // Thực hiện xử lý thanh toán
                  // Đây là nơi để bạn gọi hàm xử lý thanh toán hoặc mở trang thanh toán
                  print('Thực hiện thanh toán thành công!');
                } else {
                  // Hiển thị thông báo nếu người dùng nhập ngôn ngữ không phù hợp
                  print('Vui lòng nhập ngôn ngữ là "vi_VN" để thanh toán thành công.');
                }
              },
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
