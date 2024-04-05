import 'package:doantotnghiep/src/modules/authen/pages/home.dart';
import 'package:doantotnghiep/src/modules/authen/widgets/circle_button.dart';
import 'package:doantotnghiep/src/modules/authen/widgets/search_testfield.dart';
import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  const Search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      toolbarHeight: 250,
      title: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const HomePage()),
          );
        },
        child: Container(
          alignment: Alignment.bottomCenter, // Căn chỉnh phần Search ở dưới cùng
          height: 250, // Kích thước cố định cho phần Search
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10), // Padding cho phần Search
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hello,\nGood Morning",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  CircleButton(
                    icon: Icons.notifications,
                    onPressed: () {},
                  ),
                ],
              ),

              const SearchTextField(),
            ],
          ),
        ),
      ),
      flexibleSpace: Container(
        height: 150,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0.1, 0.5],
            colors: [
              Color(0xff81ff8a),
              Color(0xff64965e),
            ],
          ),
        ),
      ),
    );
  }
}