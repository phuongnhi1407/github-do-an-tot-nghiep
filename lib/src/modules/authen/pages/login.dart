import 'package:doantotnghiep/src/modules/authen/component/page_title_bar.dart';
import 'package:doantotnghiep/src/modules/authen/component/under_part.dart';
import 'package:doantotnghiep/src/modules/authen/component/upside.dart';
import 'package:doantotnghiep/src/modules/authen/pages/signup.dart';
import 'package:doantotnghiep/src/modules/authen/style/colors.dart';
import 'package:doantotnghiep/src/modules/authen/widgets/rounded_button.dart';
import 'package:doantotnghiep/src/modules/authen/widgets/rounded_input_field.dart';
import 'package:doantotnghiep/src/modules/authen/widgets/rounded_input_number_field.dart';
import 'package:doantotnghiep/src/modules/authen/widgets/rounded_password_field.dart';
import 'package:flutter/material.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

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
                  imgUrl: "assets/images/dapxetroitoithui.png",
                ),
                const PageTitleBar(title: 'Đăng nhập bằng tài khoản của bạn'),
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
                              const RoundedInputNumberField(
                                  hintText: "Số điện thoại", icon: Icons.phone),
                              const RoundedPasswordField(),
                              switchListTile(),
                              RoundedButton(text: 'ĐĂNG NHẬP', press: () {}),
                              const SizedBox(
                                height: 10,
                              ),
                              UnderPart(
                                title: "Bạn chưa có tài khoản?",
                                navigatorText: "Đăng ký ngay",
                                onTap: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) => const SignUpScreen())
                                  );
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
                              const SizedBox(height: 20,)
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

