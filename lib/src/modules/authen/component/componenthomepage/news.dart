import 'package:doantotnghiep/src/modules/authen/data/news.dart';
import 'package:doantotnghiep/src/modules/authen/style/colors.dart';
import 'package:flutter/material.dart';


class News extends StatelessWidget {
  const News({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //News
        ...news.map((item) => Padding(
          padding: const EdgeInsets.only(bottom: 24, left: 16, right: 16),
          child: Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: dark4)),
            child: Column(
              children: [
                Image.asset(item.image),
                Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.title,
                        style: bold16.copyWith(color: dark1),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        item.description,
                        style: regular14.copyWith(color: dark2),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ))
      ],
    );
  }
}