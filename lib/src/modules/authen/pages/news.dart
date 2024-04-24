import 'package:doantotnghiep/src/modules/authen/dtos/models/news_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:doantotnghiep/src/modules/authen/provider/authen_provider.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  @override
  void initState() {
    super.initState();
    // Gọi phương thức để lấy tin tức khi màn hình được khởi tạo
    Provider.of<AuthenProvider>(context, listen: false).fetchNews(context);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('News'),
        ),
        body: Consumer<AuthenProvider>(
          builder: (context, authenProvider, _) {
            // Nếu isLoadingNews là true, hiển thị widget CircularProgressIndicator
            if (authenProvider.isLoadingNews) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            // Nếu không có tin tức hoặc có lỗi, hiển thị thông báo
            else if (authenProvider.newsInfo == null) {
              return Center(
                child: Text('No news available'),
              );
            }
            // Nếu có tin tức, hiển thị thông tin tin tức
            else {
              return _buildNewsInfo(authenProvider.newsInfo!);
            }
          },
        ),
      ),
    );
  }

  // Phương thức để xây dựng giao diện hiển thị thông tin tin tức
  Widget _buildNewsInfo(NewsData newsInfo) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Hiển thị tiêu đề tin tức
          Text(
            newsInfo.title ?? '',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16),
          // Hiển thị hình ảnh tin tức (nếu có)
          if (newsInfo.image != null)
            Image.network(
              newsInfo.image!,
              height: 200,
              fit: BoxFit.cover,
            ),
          SizedBox(height: 16),
          // Hiển thị nội dung tin tức
          Text(newsInfo.content ?? ''),
        ],
      ),
    );
  }
}