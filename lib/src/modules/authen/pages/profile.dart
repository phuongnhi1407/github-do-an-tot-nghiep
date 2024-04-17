import 'package:doantotnghiep/src/modules/authen/component/page_title_bar.dart';
import 'package:doantotnghiep/src/modules/authen/provider/authen_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  AuthenProvider? authenProvider;

  @override
  void initState() {
    super.initState();
    authenProvider = Provider.of<AuthenProvider>(context, listen: false);
    handleProfile(); // Gọi handleProfile để lấy thông tin người dùng
  }

  void handleProfile() async {
    // Logic để lấy thông tin người dùng
    await authenProvider?.fetchProfile(context);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
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
                buildUserInfoTile(
                  'Họ và tên',
                  authenProvider?.userInfo?.fullName ?? '',
                ),
                buildUserInfoTile(
                  'Ngày sinh',
                  authenProvider?.userInfo?.dateOfBirth ?? '',
                ),
                buildUserInfoTile(
                  'Địa chỉ',
                  authenProvider?.userInfo?.address ?? '',
                ),
                buildUserInfoTile(
                  'Email',
                  authenProvider?.userInfo?.email ?? '',
                ),
                buildUserInfoTile(
                  'Căn cước công dân',
                  authenProvider?.userInfo?.cardId ?? '',
                ),
                buildUserInfoTile(
                  'Số điện thoại',
                  authenProvider?.userInfo?.phoneNumber ?? '',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildUserInfoTile(String title, String value) {
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