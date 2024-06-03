import 'package:doantotnghiep/src/modules/authen/component/componenthomepage/menus.dart';
import 'package:doantotnghiep/src/modules/authen/component/componenthomepage/news.dart';
import 'package:doantotnghiep/src/modules/authen/component/componenthomepage/search.dart';
import 'package:doantotnghiep/src/modules/authen/data/icons.dart';
import 'package:doantotnghiep/src/modules/authen/pages/transactionhistory.dart';
import 'package:doantotnghiep/src/modules/authen/pages/notificationlist.dart';
import 'package:doantotnghiep/src/modules/authen/pages/qrscreen.dart';
import 'package:doantotnghiep/src/modules/authen/pages/setting.dart';
import 'package:doantotnghiep/src/modules/authen/style/colors.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _BaseScreenState createState() => _BaseScreenState();
}

class _BaseScreenState extends State<HomePage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [Search(), Menus(), News()],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: kPrimaryColor1,
        backgroundColor: Colors.white,
        elevation: 0,
        items: [
          BottomNavigationBarItem(
            activeIcon: Image.asset(
              'assets/images/home.png',
              height: kBottomNavigationBarItemSize,
            ),
            icon: Image.asset(
              'assets/images/homemo.png',
              height: kBottomNavigationBarItemSize,
            ),
            label: "Trang chủ",
          ),
          BottomNavigationBarItem(
            activeIcon: Image.asset(
              'assets/images/tram.png',
              height: kBottomNavigationBarItemSize,
            ),
            icon: Image.asset(
              icTramOutlined,
              height: kBottomNavigationBarItemSize,
            ),
            label: "Trạm xe",
          ),
          BottomNavigationBarItem(
            activeIcon: Image.asset(
              icQr,
              height: kBottomNavigationBarItemSize,
            ),
            icon: Image.asset(
              icQrOutlined,
              height: kBottomNavigationBarItemSize,
            ),
            label: "Quét QR",
          ),
          BottomNavigationBarItem(
            activeIcon: Image.asset(
              icThongbao,
              height: kBottomNavigationBarItemSize,
            ),
            icon: Image.asset(
              icThongbaoOutlined,
              height: kBottomNavigationBarItemSize,
            ),
            label: "Thông báo",
          ),
          BottomNavigationBarItem(
            activeIcon: Image.asset(
              icTaikhoan,
              height: kBottomNavigationBarItemSize,
            ),
            icon: Image.asset(
              icTaikhoanOutlined,
              height: kBottomNavigationBarItemSize,
            ),
            label: "Tài khoản",
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
            // Xử lý khi người dùng chọn một mục trong thanh điều hướng dưới cùng
            if (index == 1) {
              // Điều hướng sang màn hình hướng dẫn khi chọn mục "Quét QR"
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const TransactionHistoryScreen()),
              );
            }
            else if(index == 2){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Qrscreen(title: "Quét qr")),
              );
            }
            else if(index == 3){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const NotificationScreen()));
            }
            else if(index == 4){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SettingsScreen()),
              );
            }
          });
        },
      ),
    );
  }
}