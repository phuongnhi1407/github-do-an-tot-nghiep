import 'package:doantotnghiep/src/modules/authen/style/colors.dart';
import 'package:doantotnghiep/src/modules/authen/widgets/text_field_container.dart';
import 'package:flutter/material.dart';

class RoundedInputNumberField extends StatefulWidget {
  const RoundedInputNumberField({
    Key? key,
    this.hintText,
    this.icon = Icons.person,
  }) : super(key: key);
  final String? hintText;
  final IconData icon;

  @override
  State<RoundedInputNumberField> createState() =>
      _RoundedInputNumberFieldState();
}

class _RoundedInputNumberFieldState extends State<RoundedInputNumberField> {
  final bool isShowPasword = false;
  void initState() {
    super.initState();
    // khoi tạo
  }

// setState() {isShowPasword = true}
  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        cursorColor: kPrimaryColor,
        keyboardType: TextInputType.number, // Thay đổi kiểu nhập liệu thành số
        decoration: InputDecoration(
          icon: Icon(
            widget.icon,
            color: kPrimaryColor,
          ),
          hintText: widget.hintText,
          hintStyle: const TextStyle(fontFamily: 'OpenSans'),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
