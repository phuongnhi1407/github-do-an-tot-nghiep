import 'dart:convert';

import 'package:flutter/services.dart';

class AppConfig {
  final String? host;
  AppConfig({this.host});
  static Future<AppConfig> forEnvironment() async {
    final localConfig =
        await rootBundle.loadString('assets/config/config.json');
    // decode our json
    final json = jsonDecode(localConfig);
    return AppConfig(host: json['baseUrl']);
  }
}
