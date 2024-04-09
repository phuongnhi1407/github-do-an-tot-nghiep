import 'package:doantotnghiep/src/modules/authen/data/icons.dart';
import 'package:doantotnghiep/src/modules/authen/pages/huongdan.dart';
import 'package:doantotnghiep/src/modules/authen/pages/login.dart';
import 'package:doantotnghiep/src/modules/authen/style/colors.dart';
import 'package:flutter/material.dart';

class Menus extends StatelessWidget {
  const Menus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 27, right: 27, top: 32),
      child: Column( // Thêm một Column để chứa cả chữ "Tiện ích" và menuIcons
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8), // Thay đổi giá trị lề
            child: Text(
              "Tiện ích", // Thêm chữ "Tiện ích"
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 230,
            child: GridView.count(
              crossAxisCount: 4,
              mainAxisSpacing: 8,
              children: menuIcons.map((icon) {
                return Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        // Thực hiện chuyển hướng sang trang tương ứng với mỗi icon
                        if (icon.title == 'Trạm xe') {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> const LoginScreen()));
                        } else if (icon.title == 'Hướng dẫn') {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> const TutorialPage()));
                        }
                        // Thêm các điều kiện khác tương tự cho các icon khác
                      },
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Image.asset(
                          icon.icon,
                          height: 50,
                          width: 50,
                        ),
                      ),
                    ),
                    const SizedBox(height: 9),
                    Text(
                      icon.title,
                      style: regular12_5.copyWith(color: dark2),
                    ),
                  ],
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}