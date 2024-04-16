import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Setting {
  final String title;
  final String route;
  final IconData icon;

  Setting({
    required this.title,
    required this.route,
    required this.icon,
  });
}

final List<Setting> settings = [
  Setting(
    title: "Ngôn ngữ",
    route: "/",
    icon: CupertinoIcons.airplane,
  ),
  Setting(
    title: "Đổi mật khẩu",
    route: "/",
    icon: Icons.password_sharp,
  ),
  Setting(
    title: "Đánh giá ứng dụng",
    route: "/",
    icon: CupertinoIcons.star_fill,
  ),
  Setting(
    title: "Đăng xuất",
    route: "/",
    icon: CupertinoIcons.exclamationmark_bubble_fill,
  ),
];

final List<Setting> settings2 = [
  Setting(
    title: "Chính sách và quy định",
    route: "/",
    icon: CupertinoIcons.book_solid,
  ),
  Setting(
    title: "Hỗ trợ khách hàng",
    route: "/",
    icon: CupertinoIcons.phone,
  ),
  Setting(
    title: "Mời bạn bè",
    route: "/",
    icon: CupertinoIcons.person_3_fill,
  ),
];