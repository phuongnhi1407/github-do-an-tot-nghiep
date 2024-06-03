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
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text(
            'Hồ sơ cá nhân',
            style: TextStyle(
              color: Colors.white, // Màu chữ trắng
              fontSize: 20, // Kích thước chữ lớn hơn
              fontWeight: FontWeight.bold, // Chữ đậm
            ),
          ),
          centerTitle: true, // Căn giữa tiêu đề của AppBar
        ),
        body: Consumer<AuthenProvider>(
          builder: (context, _authenProvider, _) {
            if (_authenProvider.isLoadingUser) {
              return Center(child: CircularProgressIndicator());
            }
            return SizedBox(
              width: size.width,
              height: size.height,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 20),
                      CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.green, // Màu xanh
                        child: CircleAvatar(
                          radius: 48,
                          backgroundImage: AssetImage('assets/images/avt.png'),
                          // Nếu bạn có URL ảnh từ backend, thay thế bằng NetworkImage
                          // backgroundImage: NetworkImage(authenProvider?.userInfo?.avatarId ?? 'assets/images/avt.png'),
                        ),
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
                      SizedBox(height: 30),
                      buildActionButton('Đổi mật khẩu', Colors.teal, () { // Màu xanh
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => ChangePasswordScreen())
                        );
                      }),
                      buildActionButton('Đăng xuất', Colors.green, () {
                        authenProvider?.fetchLogoutAccount(context);
                      }),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget buildUserInfoTile(String title, String value) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        subtitle: Text(
          value,
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey[700],
          ),
        ),
      ),
    );
  }

  Widget buildActionButton(String text, Color color, VoidCallback onPressed) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        width: double.infinity,
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(20),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: color.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 5,
                ),
              ],
            ),
            child: Center(
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
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
                // Thêm logic xóa tài khoản ở đây
                Navigator.pop(context); // Đóng hộp thoại xác nhận
              },
              child: Text("Xác nhận"),
            ),
          ],
        );
      },
    );
  }
}
