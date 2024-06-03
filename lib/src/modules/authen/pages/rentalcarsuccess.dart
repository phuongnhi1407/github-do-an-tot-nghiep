import 'package:doantotnghiep/src/modules/authen/pages/map.dart';
import 'package:flutter/material.dart';
import 'package:doantotnghiep/src/modules/authen/provider/authen_provider.dart';
import 'package:doantotnghiep/src/modules/authen/pages/home.dart';
import 'package:provider/provider.dart';

class UnlockSuccessScreen extends StatefulWidget {
  const UnlockSuccessScreen({
    Key? key,
    required this.id,
  }) : super(key: key);

  final int id;

  @override
  _UnlockSuccessScreenState createState() => _UnlockSuccessScreenState();
}

class _UnlockSuccessScreenState extends State<UnlockSuccessScreen> {
  final TextEditingController _bikeIdController = TextEditingController();

  AuthenProvider? authenProvider;
  @override
  void initState() {
    super.initState();
    authenProvider = Provider.of<AuthenProvider>(context, listen: false);
    handleBikeId();
  }

  void handleBikeId() async {
    int bikeId = widget.id;
    await authenProvider?.activateBike(context, bikeId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mở khóa thành công'),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Icon(
              Icons.check_circle,
              color: Colors.green,
              size: 100.0,
            ),
            SizedBox(height: 32.0),
            Text(
              'Xe đã được mở khóa thành công!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 32.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MapScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.blue,
                padding: EdgeInsets.symmetric(
                  vertical: 16.0,
                ),
                textStyle: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              child: Text('Quay Lại Trang Chủ'),
            ),
          ],
        ),
      ),
    );
  }
}
