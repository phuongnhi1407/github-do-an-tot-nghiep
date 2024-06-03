import 'package:doantotnghiep/src/modules/authen/dtos/models/listnews_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:doantotnghiep/src/modules/authen/provider/authen_provider.dart';

class ListNewScreen extends StatelessWidget {
  const ListNewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authenProvider = Provider.of<AuthenProvider>(context);

    // Gọi phương thức fetchNotification để lấy thông báo từ API
    authenProvider.fetchlistnews(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Danh sách tin tức',
          style: TextStyle(
            color: Colors.white, // Màu chữ trắng
            fontSize: 20, // Kích thước chữ lớn hơn
            fontWeight: FontWeight.bold, // Chữ đậm
          ),
        ),
        centerTitle: true, // Căn giữa tiêu đề của AppBar
      ),
      body: authenProvider.isLoadinglistnews
          ? Center(
        child: CircularProgressIndicator(),
      )
          : authenProvider.listnewsList != null
          ? ListView.builder(
        itemCount: authenProvider.listnewsList!.length,
        itemBuilder: (context, index) {
          final ListNewsData listnews =
          authenProvider.listnewsList![index];

          // Debugging: Print out the title to see if it exists
          print("Title: ${listnews.tilte}");

          return Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 8.0, vertical: 4.0),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              elevation: 3,
              child: ListTile(
                leading: listnews.image != null
                    ? ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    listnews.image!,
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                )
                    : Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Icon(
                    Icons.image,
                    color: Colors.grey[700],
                  ),
                ),
                title: Text(
                  listnews.tilte ?? 'No Title',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 5),
                    Text(listnews.content ?? 'No Content'),
                    SizedBox(height: 5),
                    Text(
                      listnews.createdDate ?? '',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                onTap: () {
                  // Xử lý khi người dùng chọn một thông báo cụ thể
                  // Ví dụ: mở chi tiết thông báo
                },
              ),
            ),
          );
        },
      )
          : Center(
        child: Text(authenProvider.errorMessage ??
            'Không có tin tức sự kiện'),
      ),
    );
  }
}
