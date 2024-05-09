import 'package:doantotnghiep/src/modules/authen/pages/recharge.dart';
import 'package:doantotnghiep/src/modules/authen/provider/authen_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyWalletScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authenProvider = Provider.of<AuthenProvider>(context);

    // Gọi phương thức fetchMyWallet để lấy thông tin ví tiền từ API
    authenProvider.fetchMyWallet(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Thông tin ví tiền'),
      ),
      body: Column(
        children: [
          Expanded(
            child: authenProvider.isLoadingWallet
                ? Center(
              child: CircularProgressIndicator(),
            )
                : authenProvider.walletInfo != null
                ? Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'ID Người dùng: ${authenProvider.walletInfo!.userId}',
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Số dư hiện tại: ${authenProvider.walletInfo!.currentPoint}',
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Nợ phí: ${authenProvider.walletInfo!.debtCharge}',
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
            )
                : Center(
              child: Text(
                authenProvider.errorMessage ??
                    'Không có thông tin ví tiền',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> RechargeScreen()));
                },
                child: Text('Nạp điểm'),
              ),
              ElevatedButton(
                onPressed: () {
                  // Xử lý khi nhấn nút khuyến mãi
                },
                child: Text('Khuyến mãi'),
              ),
              ElevatedButton(
                onPressed: () {
                  // Xử lý khi nhấn nút chia sẻ điểm
                },
                child: Text('Chia sẻ điểm'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}