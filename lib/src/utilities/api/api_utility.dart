import 'package:doantotnghiep/src/common/constant.dart';
import 'package:http/http.dart' as http;

import 'package:shared_preferences/shared_preferences.dart';

class ApiUtility {
  static ApiUtility _instance = new ApiUtility.internal();
  ApiUtility.internal();

  factory ApiUtility() => _instance;

// get api
  Future<http.Response> get(String url) {
    return http
        .get(Uri.parse(url))
        .then((http.Response res) => handleResponse(res));
  }
// post api

  Future<http.Response> post(String url,
      {body, hasToken = false, encoding}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return http
        .post(Uri.parse(url),
            body: body,
            headers: {
              'lang': prefs.getString('culture') ?? "",
              'Content-Type': 'application/json',
              'Token': hasToken ? prefs.getString("token").toString() : "",
            },
            encoding: encoding)
        .timeout(Duration(seconds: DURATION_SECONDS_TIME_OUT))
        .then((http.Response response) {
      return handleResponse(response);
    });
  }

  // put api
  Future<http.Response> put(String url, {body, encoding}) {
    return http
        .put(Uri.parse(url),
        body: body,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        encoding: encoding)
        .then((http.Response response) {
      if (response.statusCode == 200) {
        // Nếu phản hồi thành công, trả về phản hồi
        return response;
      } else {
        // Nếu có lỗi, ném ra một ngoại lệ với thông báo lỗi
        throw Exception('Failed to fetch data: ${response.statusCode}');
      }
    }).catchError((error) {
      // Xử lý các lỗi trong quá trình gửi yêu cầu hoặc nhận phản hồi
      throw Exception('Error while fetching data: $error');
    });
  }


//delete api
  Future<http.Response> delete(String url, {body}) {
    return http.delete(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: body,
    ).then((http.Response response) {
      return handleResponse(response);
    });
  }
//   Future<http.Response> delete(String url) {
//     return http.delete(
//       Uri.parse(url),
//       headers: <String, String>{
//         'Content-Type': 'application/json; charset=UTF-8',
//       },
//     ).then((http.Response response) {
//       return handleResponse(response);
//     });
//   }

// check status code
  http.Response handleResponse(http.Response response) {
    int statusCode = response.statusCode;
    if (statusCode == 401) {
      throw Exception("Loi 401");
    } else if (statusCode != 200) {
      throw Exception("Error while fetching data");
    }
    (response.body);
    return response;
  }
}
