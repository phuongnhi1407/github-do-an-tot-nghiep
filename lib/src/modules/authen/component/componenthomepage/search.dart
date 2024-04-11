import 'package:flutter/material.dart';
import 'package:doantotnghiep/src/modules/authen/widgets/circle_button.dart';
import 'package:doantotnghiep/src/modules/authen/widgets/search_testfield.dart';

class Search extends StatelessWidget {
  const Search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      toolbarHeight: 250,
      title: Container(
        alignment: Alignment.bottomCenter,
        height: 250,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Chào,\nNgày mới vui vẻ",
                  style: TextStyle(
                    color: Colors.blueAccent, // Thiết lập màu văn bản thành màu tím
                    fontSize: 24, // Cỡ chữ
                    fontWeight: FontWeight.bold, // Độ đậm của chữ
                  ),
                ),
                CircleButton(
                  icon: Icons.person_outline_outlined,
                  onPressed: () {},
                ),
              ],
            ),
            const SearchTextField(),
          ],
        ),
      ),
      flexibleSpace: Container(
        height: 300,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
          image: DecorationImage(
            image: AssetImage('assets/images/logosearch2.png'), // Đặt đường dẫn hình ảnh của bạn ở đây
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}