import 'dart:convert';

import 'package:flutter/services.dart';

class AppConfig {
  final String? host;

  AppConfig({this.host});

  static Future<AppConfig> forEnvironment({bool baseUser = false}) async {
    final localConfig =
    await rootBundle.loadString('assets/config/config.json');
    // decode our json
    final json = jsonDecode(localConfig);
    if (baseUser) {
      return AppConfig(host: json['baseUrlUser']);
    }
    else {
      return AppConfig(host: json['baseUrl']);
    }
  }
}
// import 'dart:convert';
// import 'package:flutter/services.dart';
//
// class ApiConfig {
//   final String baseUrl;
//   final String baseUrlUser;
//
//   ApiConfig({required this.baseUrl, required this.baseUrlUser});
//
//   static Future<ApiConfig> forEnvironment() async {
//     final localConfig = await rootBundle.loadString('assets/config/config.json');
//     final json = jsonDecode(localConfig);
//     return ApiConfig(
//       baseUrl: json['baseUrl'],
//       baseUrlUser: json['baseUrlUser'],
//     );
//   }
// }

// import 'dart:convert';
//
// import 'package:flutter/services.dart';
//
// class AppConfig {
//   final String? host;
//   AppConfig({this.host});
//   static Future<AppConfig> forEnvironment() async {
//     final localConfig =
//         await rootBundle.loadString('assets/config/config.json');
//     // decode our json
//     final json = jsonDecode(localConfig);
//     return AppConfig(host: json['baseUrl']);
//   }
// }
