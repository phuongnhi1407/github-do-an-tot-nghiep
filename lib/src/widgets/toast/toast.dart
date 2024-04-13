import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastCustom {
  void showBottom(BuildContext context, {String? msg, Color? color}) {
    Fluttertoast.showToast(
      msg: msg.toString(),
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: color,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}
