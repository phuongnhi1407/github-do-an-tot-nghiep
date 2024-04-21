import 'package:doantotnghiep/src/modules/authen/provider/authen_provider.dart';
import 'package:flutter/material.dart';
import 'package:doantotnghiep/src/modules/authen/pages/profile.dart';
import 'package:doantotnghiep/src/modules/authen/style/colors.dart';
import 'package:provider/provider.dart'; // Import provider để sử dụng context

class AvatarCard extends StatelessWidget {
  const AvatarCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // Sử dụng Provider để truy cập giá trị của userId

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
                // Gọi hàm đăng xuất từ AuthenProvider
                Provider.of<AuthenProvider>(context, listen: false).fetchLogoutAccount(context);
              },
              child: const Text(
                "Đăng xuất",
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