import 'package:doantotnghiep/src/modules/authen/component/componenthomepage/search.dart';
import 'package:doantotnghiep/src/modules/authen/style/colors.dart';
import 'package:flutter/material.dart';


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: green2,
          elevation: 0,
          toolbarHeight: 71,
          title: const Search()),
      body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            //children: const [Search(), Gopay(), Menus(), GoCLub(), Akses(), News()],
          )),
    );
  }
}