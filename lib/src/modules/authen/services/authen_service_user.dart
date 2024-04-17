// import 'dart:convert';
//
// import 'package:doantotnghiep/src/config.dart';
// import 'package:doantotnghiep/src/modules/authen/dtos/models/profile_model.dart';
// import 'package:doantotnghiep/src/modules/authen/routes.dart';
// import 'package:doantotnghiep/src/utilities/api/api_utility.dart';
//
// class AuthenServiceUser {
//   final _apiUtility = ApiUtility();
//
//   Future<ProfileResponse?> getProfile() async {
//     try {
//       final config = await AppConfig.forEnvironment();
//       final url = "${config.host}/$PROFILE_URL";
//       final response = await _apiUtility.get(url);
//       if (response.statusCode == 200) {
//         final jsonResponse = json.decode(response.body);
//         return ProfileResponse.fromJson(jsonResponse);
//       } else {
//         print("Failed to load profile");
//         return null;
//       }
//     } catch (e) {
//       print("Error: $e");
//       return null;
//     }
//   }
// }