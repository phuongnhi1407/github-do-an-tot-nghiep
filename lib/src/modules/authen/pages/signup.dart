import 'package:doantotnghiep/src/modules/authen/component/page_title_bar.dart';
import 'package:doantotnghiep/src/modules/authen/component/upside.dart';
import 'package:doantotnghiep/src/modules/authen/dtos/request/signup_request.dart';
import 'package:doantotnghiep/src/modules/authen/provider/authen_provider.dart';
import 'package:doantotnghiep/src/modules/authen/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}
class _SignUpScreenState extends State<SignUpScreen> {
  final _fullNameController = TextEditingController();
  final _userNameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _addressController = TextEditingController();
// authen signup
  AuthenProvider? authenProvider;
  @override
  void initState() {
    super.initState();
    authenProvider = Provider.of<AuthenProvider>(context, listen: false);
    // _userNameController = TextEditingController();
    // _passwordController = TextEditingController();
  }

  // void hanleSignup({String? fullName,String? userName,String? password,String? email,String? phoneNumber, String? address}) async {
  //   SignUpRequest request = SignUpRequest(fullname: fullName,username: userName, password: password,email: email ,phonenumber: phoneNumber,address: address,);
  //   await authenProvider?.fetchSignUp(context, request);
  // }


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: size.width,
          height: size.height,
          child: SingleChildScrollView(
            child: Stack(
              children: [
                const Upside(
                  imgUrl: "assets/images/logo.png",
                ),
                const PageTitleBar(title: 'Tạo một tài khỏan mới của bạn'),
                Padding(
                  padding: const EdgeInsets.only(top: 320.0),
                  child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 15,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                    Form(
                      child: Column(
                        children: [
                          Container(
                            margin:
                            const EdgeInsets.symmetric(vertical: 10),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 5),
                            width: size.width * 0.8,
                            decoration: BoxDecoration(
                              color: kPrimaryLightColor,
                              borderRadius: BorderRadius.circular(29),
                            ),
                            child: TextField(
                              controller: _fullNameController,
                              cursorColor: kPrimaryColor,
                              keyboardType: TextInputType
                                  .text, // Thay đổi kiểu nhập liệu thành số
                              decoration: InputDecoration(
                                icon: Icon(
                                  Icons.drive_file_rename_outline_sharp,
                                  color: kPrimaryColor,
                                ),
                                hintText: "Tên đầy đủ của bạn",
                                hintStyle:
                                const TextStyle(fontFamily: 'OpenSans'),
                                border: InputBorder.none,
                              ),
                              onChanged: (value) {
                                setState(() {
                                  // userName = value;
                                  print(value);
                                });
                              },
                            ),
                          ),
                          Container(
                            margin:
                            const EdgeInsets.symmetric(vertical: 10),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 5),
                            width: size.width * 0.8,
                            decoration: BoxDecoration(
                              color: kPrimaryLightColor,
                              borderRadius: BorderRadius.circular(29),
                            ),
                            child: TextField(
                              controller: _userNameController,
                              cursorColor: kPrimaryColor,
                              keyboardType: TextInputType
                                  .text, // Thay đổi kiểu nhập liệu thành số
                              decoration: InputDecoration(
                                icon: Icon(
                                  Icons.person_outline_sharp,
                                  color: kPrimaryColor,
                                ),
                                hintText: "Tên tài khoản",
                                hintStyle:
                                const TextStyle(fontFamily: 'OpenSans'),
                                border: InputBorder.none,
                              ),
                              onChanged: (value) {
                                setState(() {
                                  // userName = value;
                                  print(value);
                                });
                              },
                            ),
                          ),
                          Container(
                            margin:
                            const EdgeInsets.symmetric(vertical: 10),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 5),
                            width: size.width * 0.8,
                            decoration: BoxDecoration(
                              color: kPrimaryLightColor,
                              borderRadius: BorderRadius.circular(29),
                            ),
                            child: TextFormField(
                              controller: _passwordController,
                              obscureText: true,
                              cursorColor: kPrimaryColor,
                              decoration: const InputDecoration(
                                icon: Icon(
                                  Icons.lock,
                                  color: kPrimaryColor,
                                ),
                                hintText: "Mật khẩu",
                                hintStyle:
                                TextStyle(fontFamily: 'OpenSans'),
                                suffixIcon: Icon(
                                  Icons.visibility,
                                  color: kPrimaryColor,
                                ),
                                border: InputBorder.none,
                              ),
                              onChanged: (value) {
                                setState(() {
                                  // password = value;
                                  print(value);
                                  // print(password);
                                });
                              },
                            ),
                          ),
                          Container(
                            margin:
                            const EdgeInsets.symmetric(vertical: 10),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 5),
                            width: size.width * 0.8,
                            decoration: BoxDecoration(
                              color: kPrimaryLightColor,
                              borderRadius: BorderRadius.circular(29),
                            ),
                            child: TextField(
                              controller: _emailController,
                              cursorColor: kPrimaryColor,
                              keyboardType: TextInputType
                                  .text, // Thay đổi kiểu nhập liệu thành số
                              decoration: InputDecoration(
                                icon: Icon(
                                  Icons.email,
                                  color: kPrimaryColor,
                                ),
                                hintText: "Email",
                                hintStyle:
                                const TextStyle(fontFamily: 'OpenSans'),
                                border: InputBorder.none,
                              ),
                              onChanged: (value) {
                                setState(() {
                                  // userName = value;
                                  print(value);
                                });
                              },
                            ),
                          ),
                          Container(
                            margin:
                            const EdgeInsets.symmetric(vertical: 10),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 5),
                            width: size.width * 0.8,
                            decoration: BoxDecoration(
                              color: kPrimaryLightColor,
                              borderRadius: BorderRadius.circular(29),
                            ),
                            child: TextField(
                              controller: _phoneNumberController,
                              cursorColor: kPrimaryColor,
                              keyboardType: TextInputType
                                  .text, // Thay đổi kiểu nhập liệu thành số
                              decoration: InputDecoration(
                                icon: Icon(
                                  Icons.phone,
                                  color: kPrimaryColor,
                                ),
                                hintText: "Số điện thoại",
                                hintStyle:
                                const TextStyle(fontFamily: 'OpenSans'),
                                border: InputBorder.none,
                              ),
                              onChanged: (value) {
                                setState(() {
                                  // userName = value;
                                  print(value);
                                });
                              },
                            ),
                          ),
                          Container(
                            margin:
                            const EdgeInsets.symmetric(vertical: 10),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 5),
                            width: size.width * 0.8,
                            decoration: BoxDecoration(
                              color: kPrimaryLightColor,
                              borderRadius: BorderRadius.circular(29),
                            ),
                            child: TextField(
                              controller: _addressController,
                              cursorColor: kPrimaryColor,
                              keyboardType: TextInputType
                                  .text, // Thay đổi kiểu nhập liệu thành số
                              decoration: InputDecoration(
                                icon: Icon(
                                  Icons.home,
                                  color: kPrimaryColor,
                                ),
                                hintText: "Địa chỉ",
                                hintStyle:
                                const TextStyle(fontFamily: 'OpenSans'),
                                border: InputBorder.none,
                              ),
                              onChanged: (value) {
                                setState(() {
                                  // userName = value;
                                  print(value);
                                });
                              },
                            ),
                          ),
                          // RoundedButton(
                          //     text: 'ĐĂNG KÝ',
                          //     press: () async {
                          //       hanleLogin(
                          //           fullName: _fullNameController.text,
                          //           userName: _userNameController.text,
                          //           password: _passwordController.text,
                          //           email: _emailController.text,
                          //           phoneNumber: _phoneNumberController.text,
                          //           address: _addressController.text,
                          //
                          //           );
                          //     }),
                          // const SizedBox(
                          //   height: 10,
                          // ),
                          // UnderPart(
                          //   title: "Bạn đã có tài khoản?",
                          //   navigatorText: "Đăng nhập ngay",
                          //   onTap: () {
                          //     Navigator.push(
                          //         context,
                          //         MaterialPageRoute(
                          //             builder: (context) =>
                          //             LoginScreen()));
                          //   },
                          // ),
                          // const SizedBox(
                          //   height: 20,
                          // )


                      ],
                    ),
                  ),

              ],
            ),
          ),
        ),
      ],
        ),
      ),
    ),
    ),
    );
  }
}