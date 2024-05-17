import 'package:doantotnghiep/src/modules/authen/pages/changepassword.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:doantotnghiep/src/modules/authen/provider/authen_provider.dart';

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
    Size size = MediaQuery
        .of(context)
        .size;
    return SafeArea(
      child: Scaffold(
        body: Consumer<AuthenProvider>
          (builder: (context, _authenProvider, _) {
          return _authenProvider.isLoadingUser ? const CircularProgressIndicator() : SizedBox(
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
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => ChangePasswordScreen())
                      );

                    },
                    child: Text('Đổi mật khẩu'),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Cập nhật thông tin
                      authenProvider?.fetchLogoutAccount(context);
                    },
                    child: Text('Đăng xuẩt'),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Xóa tài khoản
                      showConfirmationDialog(context);
                    },
                    child: Text('Xóa tài khoản'),
                  ),
                ],
              ),
            ),
          );
        },)
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

  void showConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Xác nhận"),
          content: Text("Bạn có chắc chắn muốn xóa tài khoản không?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Đóng hộp thoại xác nhận
              },
              child: Text("Hủy"),
            ),
            TextButton(
              onPressed: () {

              },
              child: Text("Xác nhận"),
            ),
          ],
        );
      },
    );
  }
}