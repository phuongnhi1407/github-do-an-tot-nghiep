import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Upside extends StatelessWidget {
  const Upside({Key? key, required this.imgUrl}) : super(key: key);
  final String imgUrl;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        // Ảnh nền (kkk.png)
        Image.asset(
          'assets/images/nui.png', // Thay đổi đường dẫn của ảnh kkk.png theo đúng đường dẫn của bạn
          width: size.width,
          height: size.height / 2,
          fit: BoxFit.cover,
        ),
        // Ảnh chồng lên (imgUrl)
        Positioned(
          top: 10,
          left: size.width * 0.5 - 100, // Đặt ảnh ở giữa màn hình theo chiều ngang
          child: Image.asset(
            imgUrl,
            width: 200, // Chiều rộng của ảnh
            height: 200, // Chiều cao của ảnh
          ),
        ),
        // Các widget khác bạn muốn chồng lên ảnh
        // iconBackButton(context),
        // ...
      ],
    );
  }
}

iconBackButton(BuildContext context) {
  return IconButton(
    color: Colors.white,
    iconSize: 28,
    icon: const Icon(CupertinoIcons.arrow_left),
    onPressed: (){
      Navigator.pop(context);
    },
  );
}