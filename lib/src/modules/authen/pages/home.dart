import 'package:doantotnghiep/src/modules/authen/component/componenthomepage/feadture.dart';
import 'package:doantotnghiep/src/modules/authen/component/componenthomepage/menus.dart';
import 'package:doantotnghiep/src/modules/authen/component/componenthomepage/news.dart';
import 'package:doantotnghiep/src/modules/authen/component/componenthomepage/search.dart';
import 'package:doantotnghiep/src/modules/authen/data/icons.dart';
import 'package:doantotnghiep/src/modules/authen/pages/huongdan.dart';
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

      body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            //children: const [Search(), Gopay(), Menus(), GoCLub(), Akses(), News()],
            children: const [ Search(),Menus(), News()],
          )),
      // body: Center(
      //   child: _widgetOptions.elementAt(_selectedIndex),
      // ),
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
            });
          }),
    );
  }
}
// return Scaffold(
//   backgroundColor: Colors.white,
//   appBar: AppBar(
//     elevation: 0, // Loại bỏ đường viền shadow của AppBar
//     toolbarHeight: 80,
//     title: const Search(),
//     flexibleSpace: Container(
//       decoration: BoxDecoration(
//         gradient: LinearGradient(
//           colors: [Color(0xff05386b), Color(0xff5cdb95)],
//           stops: [0, 1],
//           begin: Alignment.topLeft,
//           end: Alignment.bottomRight,
//         )
//
//
//       ),
//     ),
//   ),
//   body: SingleChildScrollView(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         //children: const [Search(), Gopay(), Menus(), GoCLub(), Akses(), News()],
//         children: const [Menus(), News()],
//       )),
// );
