import 'package:doantotnghiep/UI/button.dart';
import 'package:doantotnghiep/UI/constants.dart';
import 'package:doantotnghiep/src/modules/authen/pages/login.dart';
import 'package:doantotnghiep/src/modules/authen/pages/signup.dart';
import 'package:flutter/material.dart';


class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "HUEBIKE",
                    style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: primary),
                  ),
                  const Text(
                    "Đồng hành với những cuộc phiêu lưu trên hai bánh",
                    style: TextStyle(color: Colors.grey),
                  ),
                  Expanded(child: Image.asset("assets/images/logodapxe.png")),
                  Button(label: "ĐĂNG NHẬP", press: () {
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context)=> const LoginScreen()));
                  }),
                  // Button(label: "ĐĂNG KÝ", press: () {
                  //   Navigator.push(context, MaterialPageRoute(
                  //       builder: (context)=> const SignUpScreen()));
                  // }),
                  // Button(label: "ĐĂNG NHẬP", press: () {
                  //   Navigator.push(context, MaterialPageRoute(
                  //       builder: (context)=> MapScreen()));
                  // }),
                  Button(label: "ĐĂNG KÝ", press: () {
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context)=> const SignUpScreen()));
                  }),
                ],
              ),
            ),
          )),
    );
  }
}