import 'package:doantotnghiep/src/modules/authen/style/colors.dart';
import 'package:doantotnghiep/src/modules/authen/widgets/text_field_container.dart';
import 'package:flutter/material.dart';

class RoundedConfirmPasswordField extends StatelessWidget {
  const RoundedConfirmPasswordField({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        obscureText: true,
        cursorColor: kPrimaryColor,
        decoration: const InputDecoration(
            icon: Icon(
              Icons.lock,
              color: kPrimaryColor,
            ),
            hintText: "Xác nhận mật khẩu",
            hintStyle:  TextStyle(fontFamily: 'OpenSans'),
            suffixIcon: Icon(
              Icons.visibility,
              color: kPrimaryColor,
            ),
            border: InputBorder.none),
      ),
    );
  }
}