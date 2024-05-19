import 'package:doantotnghiep/src/modules/authen/dtos/models/mywallet_model.dart';
import 'package:doantotnghiep/src/modules/authen/provider/authen_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({Key? key}) : super(key: key);

  @override
  _WalletScreenState createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  @override
  void initState() {
    super.initState();
    final authenProvider = Provider.of<AuthenProvider>(context, listen: false);
    authenProvider.fetchMyWallet(context);
  }

  @override
  Widget build(BuildContext context) {
    final authenProvider = Provider.of<AuthenProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Thông tin ví tiền'),
      ),
      body: authenProvider.isLoadingWallet
          ? Center(
        child: CircularProgressIndicator(),
      )
          : authenProvider.walletInfo != null
          ? _buildWalletInfo(authenProvider.walletInfo!)
          : Center(
        child: Text(
          'Không có dữ liệu',
          style: TextStyle(fontSize: 16, color: Colors.red),
        ),
      ),
    );
  }

  Widget _buildWalletInfo(MyWalletData walletInfo) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Số dư hiện tại:',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            '${walletInfo.currentPoint} VNĐ',
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: 20),
          Text(
            'Nợ phí:',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            '${walletInfo.debtCharge} VNĐ',
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }
}
