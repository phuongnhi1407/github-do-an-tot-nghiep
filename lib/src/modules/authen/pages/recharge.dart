import 'package:doantotnghiep/src/modules/authen/dtos/request/recharge_request.dart';
import 'package:doantotnghiep/src/modules/authen/provider/authen_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RechargeScreen extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authenProvider = Provider.of<AuthenProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Nạp tiền'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Nhập số tiền',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Get the entered amount
                int amount = int.tryParse(_controller.text) ?? 0;
                // Perform recharge with the entered amount
                authenProvider.performRecharge(context, RechargeRequest(point: amount));
              },
              child: Text('Nạp tiền'),
            ),
            if (authenProvider.isLoadingRecharge)
              CircularProgressIndicator(), // Show loading indicator while recharging
          ],
        ),
      ),
    );
  }
}
