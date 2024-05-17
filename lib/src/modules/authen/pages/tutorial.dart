import 'package:flutter/material.dart';

class TutorialPage extends StatelessWidget {
  const TutorialPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.lightGreen,
        title: Text(
          'Hướng dẫn',
          style: TextStyle(
            color: Colors.black, // Màu chữ đen
            fontSize: 20, // Kích thước chữ lớn hơn
            fontWeight: FontWeight.bold, // Chữ đậm
          ),
        ),
        centerTitle: true, // Căn giữa tiêu đề của AppBar
      ),
      body: ListView( // Sử dụng ListView để có thể cuộn qua các ảnh hướng dẫn
        shrinkWrap: true, // Thuộc tính này sẽ giúp ListView co dãn theo nội dung bên trong
        children: [
          TutorialStep(imagePath: 'assets/images/huongdanmot.png'),
          TutorialStep(imagePath: 'assets/images/huongdanhai.png'),
          TutorialStep(imagePath: 'assets/images/huongdanba.png'),
          TutorialStep(imagePath: 'assets/images/huongdanbon.png'),
        ],
      ),
    );
  }
}

class TutorialStep extends StatelessWidget {
  final String imagePath;

  const TutorialStep({
    required this.imagePath,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0.0), // Loại bỏ padding
      child: Image.asset(
        imagePath,
        height: 300, // Điều chỉnh kích thước ảnh theo ý muốn
        width: double.infinity,
        fit: BoxFit.contain,
      ),
    );
  }
}