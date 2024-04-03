import 'package:doantotnghiep/src/modules/authen/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:doantotnghiep/src/modules/authen/style/colors.dart';


class Search extends StatelessWidget {
  const Search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 23, left: 15, right: 15),
        child: Row(
          children: [
            Flexible(
              fit: FlexFit.tight,
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: const Color(0xFFFAFAFA),
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: const Color(0xFFE8E8E8)),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.search,
                      color: dark1,
                      size: 20,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      'Tìm kiếm các trạm xe',
                      style: regular14.copyWith(color: dark3),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 15),
            SizedBox(
              width: 40,
              height: 40,
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: green1, width: 2),
                    ),
                    clipBehavior: Clip.hardEdge,
                    child: Image.asset('assets/images/avt.png'),
                  ),
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        width: 12,
                        height: 12,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          border: Border.all(color: green1, width: 2),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}