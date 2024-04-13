import 'package:doantotnghiep/src/modules/authen/component/page_title_bar.dart';
import 'package:doantotnghiep/src/modules/authen/component/under_part.dart';
import 'package:doantotnghiep/src/modules/authen/component/upside.dart';
import 'package:doantotnghiep/src/modules/authen/dtos/request/login_request.dart';
import 'package:doantotnghiep/src/modules/authen/pages/signup.dart';
import 'package:doantotnghiep/src/modules/authen/provider/authen_provider.dart';
import 'package:doantotnghiep/src/modules/authen/style/colors.dart';
import 'package:doantotnghiep/src/modules/authen/widgets/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _userNameController = TextEditingController();
  final _passwordController = TextEditingController();

  // authen login
  AuthenProvider? authenProvider;
  @override
  void initState() {
    super.initState();
    authenProvider = Provider.of<AuthenProvider>(context, listen: false);
    // _userNameController = TextEditingController();
    // _passwordController = TextEditingController();
  }

  void hanleLogin({String? userName, String? password}) async {
    LoginRequest request = LoginRequest(username: userName, password: password);
    await authenProvider?.fetchLogin(context, request);
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
            child: Stack(
              children: [
                const Upside(
                  imgUrl: "assets/images/logo.png",
                ),
                const PageTitleBar(title: 'Đăng nhập'),
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
                                  controller: _userNameController,
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
                              switchListTile(),

                              RoundedButton(
                                  text: 'ĐĂNG NHẬP',
                                  press: () async {
                                    hanleLogin(
                                        userName: _userNameController.text,
                                        password: _passwordController.text);
                                  }),
                              const SizedBox(
                                height: 10,
                              ),
                              UnderPart(
                                title: "Bạn chưa có tài khoản?",
                                navigatorText: "Đăng ký ngay",
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const SignUpScreen()));
                                },
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              const Text(
                                'Quên mật khẩu?',
                                style: TextStyle(
                                    color: kPrimaryColor,
                                    fontFamily: 'OpenSans',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 13),
                              ),
                              const SizedBox(
                                height: 20,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

switchListTile() {
  return Padding(
    padding: const EdgeInsets.only(left: 50, right: 40),
    child: SwitchListTile(
      dense: true,
      title: const Text(
        'Remember Me',
        style: TextStyle(fontSize: 16, fontFamily: 'OpenSans'),
      ),
      value: true,
      activeColor: kPrimaryColor,
      onChanged: (val) {},
    ),
  );
}
