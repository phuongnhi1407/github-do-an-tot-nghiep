import 'package:doantotnghiep/src/modules/authen/style/colors.dart';
import 'package:doantotnghiep/src/modules/authen/widgets/text_field_container.dart';
import 'package:flutter/material.dart';

class RoundedInputNumberField extends StatelessWidget {
  const RoundedInputNumberField({Key? key, this.hintText, this.icon = Icons.person})
      : super(key: key);
  final String? hintText;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        cursorColor: kPrimaryColor,
        keyboardType: TextInputType.number, // Thay đổi kiểu nhập liệu thành số
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: kPrimaryColor,
          ),
          hintText: hintText,
          hintStyle: const TextStyle(fontFamily: 'OpenSans'),
          border: InputBorder.none,
        ),
      ),
    );
  }
}