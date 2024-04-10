import 'package:doantotnghiep/src/modules/authen/component/page_title_bar.dart';
import 'package:doantotnghiep/src/modules/authen/component/under_part.dart';
import 'package:doantotnghiep/src/modules/authen/component/upside.dart';
import 'package:doantotnghiep/src/modules/authen/pages/login.dart';
import 'package:doantotnghiep/src/modules/authen/pages/phone.dart';
import 'package:doantotnghiep/src/modules/authen/pages/verify.dart';
import 'package:doantotnghiep/src/modules/authen/widgets/rounded_button.dart';
import 'package:doantotnghiep/src/modules/authen/widgets/rounded_confirm_password_field.dart';
import 'package:doantotnghiep/src/modules/authen/widgets/rounded_input_field.dart';
import 'package:doantotnghiep/src/modules/authen/widgets/rounded_input_number_field.dart';
import 'package:doantotnghiep/src/modules/authen/widgets/rounded_password_field.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

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
                              const RoundedInputField(
                                  hintText: "Tên đăng nhập", icon: Icons.people_alt_outlined),
                              const RoundedInputField(
                                  hintText: "Email", icon: Icons.email),
                              const RoundedInputNumberField(
                                  hintText: "Số điện thoại", icon: Icons.phone),
                              const RoundedInputNumberField(
                                  hintText: "Căn cước công dân", icon: Icons.perm_contact_cal_outlined),
                              const RoundedPasswordField(),
                              const RoundedConfirmPasswordField(),
                              RoundedButton(text: 'ĐĂNG KÝ', press: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) => const MyVerify())
                                );
                              }),
                              const SizedBox(
                                height: 10,
                              ),
                              UnderPart(
                                title: "Bạn đã có tài khoản?",
                                navigatorText: "Đăng nhập ngay",
                                onTap: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) => const LoginScreen())
                                  );
                                },
                              ),
                              const SizedBox(
                                height: 20,
                              ),
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