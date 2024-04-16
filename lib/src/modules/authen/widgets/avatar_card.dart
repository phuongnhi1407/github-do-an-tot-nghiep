import 'package:doantotnghiep/src/modules/authen/component/componentsettings/signout.dart';
import 'package:doantotnghiep/src/modules/authen/pages/profile.dart';
import 'package:doantotnghiep/src/modules/authen/style/colors.dart';
import 'package:flutter/material.dart';

class AvatarCard extends StatelessWidget {
  const AvatarCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            // Điều hướng đến trang profile khi người dùng nhấn vào ảnh
            Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfileScreen()));
          },
          child: Image.asset(
            "assets/images/avt.png",
            width: 80,
            height: 80,
          ),
        ),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Thông tin cá nhân",
              style: TextStyle(
                fontSize: kbigFontSize,
                fontWeight: FontWeight.bold,
                color: kprimaryColor,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Điều hướng đến trang xác thực khi người dùng nhấn vào nút
                Navigator.push(context, MaterialPageRoute(builder: (context) => SignoutScreen()));
              },
              child: const Text(
                "Xác thực",
                style: TextStyle(
                  fontSize: ksmallFontSize,
                  color: Colors.white,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: green1, // Màu nền của nút xác thực
              ),
            ),
          ],
        )
      ],
    );
  }
}