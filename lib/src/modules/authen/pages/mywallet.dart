import 'package:doantotnghiep/src/modules/authen/dtos/models/mywallet_model.dart';
import 'package:doantotnghiep/src/modules/authen/pages/recharge.dart';
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
        backgroundColor: Colors.teal,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Ví tiền của bạn',
          style: TextStyle(
            color: Colors.white, // Màu chữ trắng
            fontSize: 20, // Kích thước chữ lớn hơn
            fontWeight: FontWeight.bold, // Chữ đậm
          ),
        ),
        centerTitle: true, // Căn giữa tiêu đề của AppBar
      ),
      body: authenProvider.isLoadingWallet
          ? Center(
        child: CircularProgressIndicator(
          color: Colors.green, // Màu của vòng tròn tiến trình
        ),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildInfoTile(
            title: 'Số dư hiện tại:',
            value: '${walletInfo.currentPoint} ĐIỂM',
            color: Colors.green,
          ),
          SizedBox(height: 20),
          _buildInfoTile(
            title: 'Nợ phí:',
            value: '${walletInfo.debtCharge} ĐIỂM',
            color: Colors.red,
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                      const PaymentScreen()));
            },
            child: Text(
              'Nạp điểm',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green, // Màu nền của nút
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              shadowColor: Colors.black54,
              elevation: 5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoTile({
    required String title,
    required String value,
    required Color color,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Text(
            value,
            style: TextStyle(fontSize: 20, color: color),
          ),
        ],
      ),
    );
  }
}
