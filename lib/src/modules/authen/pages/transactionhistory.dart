import 'package:doantotnghiep/src/modules/authen/dtos/models/transactionhistory_model.dart';
import 'package:doantotnghiep/src/modules/authen/provider/authen_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TransactionHistoryScreen extends StatelessWidget {
  const TransactionHistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authenProvider = Provider.of<AuthenProvider>(context);

    // Gọi phương thức fetchNotification để lấy thông báo từ API
    authenProvider.fetchTransactionHistory(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Lịch sử giao dịch'),
      ),
      body: authenProvider.isLoading
          ? Center(
        child: CircularProgressIndicator(),
      )
          : authenProvider.transactionhistoryList != null
          ? ListView.builder(
        itemCount: authenProvider.transactionhistoryList!.length,
        itemBuilder: (context, index) {
          final TransactionHistoryData transactionhistory =
          authenProvider.transactionhistoryList![index];
          return ListTile(
            title: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(width: 10), // Khoảng cách giữa ảnh và title
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        transactionhistory.userFullName ?? '',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                          height: 5), // Khoảng cách giữa title và content
                      Text(
                        transactionhistory.point.toString() ?? '',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      SizedBox(
                          height: 5), // Khoảng cách giữa title và content
                      Text(
                        transactionhistory.createdDate.toString() ?? '',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            //subtitle: Text(notification.createdDate ?? ''),
            onTap: () {
              // Xử lý khi người dùng chọn một thông báo cụ thể
              // Ví dụ: mở chi tiết thông báo
            },
          );
        },
      )
          : Center(
        child: Text(
            authenProvider.errorMessage ?? 'Không có thông báo'),
      ),
    );
  }
}