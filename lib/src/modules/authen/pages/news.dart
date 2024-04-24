import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:doantotnghiep/src/modules/authen/provider/authen_provider.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  AuthenProvider? authenProvider;

  @override
  void initState() {
    super.initState();
    authenProvider = Provider.of<AuthenProvider>(context, listen: false);
    handleNews(); // Gọi handleProfile để lấy thông tin người dùng
  }

  void handleNews() async {
    // Logic để lấy thông tin người dùng
    await authenProvider?.fetchNews(context);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return SafeArea(
      child: Scaffold(
          body: Consumer<AuthenProvider>(builder: (context, _authenProvider, _) {
            return _authenProvider.isLoadingNews? const CircularProgressIndicator() : SizedBox(
              width: size.width,
              height: size.height,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 20),
                    CircleAvatar(
                      radius: 50,
                      // backgroundImage: NetworkImage(
                      //   authenProvider?.userInfo?.avatarId ?? 'assets/images/avt',
                      // ),
                    ),
                    SizedBox(height: 20),
                    buildNewsInfoTile(
                      '',
                      authenProvider?.newsInfo?.image ?? '',
                    ),
                    buildNewsInfoTile(
                      '',
                      authenProvider?.newsInfo?.title ?? '',
                    ),


                    SizedBox(height: 20),
                  ],
                ),
              ),
            );
          },)
      ),
    );
  }

  Widget buildNewsInfoTile(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.grey[700],
            ),
          ),
        ],
      ),
    );
  }


}