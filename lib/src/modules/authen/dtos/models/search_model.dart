class SearchModel {
  String? token;

  SearchModel({this.token});

  // Constructor fromJson() và toJson() từ Map và thành Map<dynamic, dynamic> không cần thiết cho mục đích tìm kiếm

  // Phương thức tìm kiếm
  bool containsToken(String searchToken) {
    // Nếu token của đối tượng bằng với searchToken, trả về true
    return token == searchToken;
  }

  // Phương thức từ JSON
  factory SearchModel.fromJson(Map<String, dynamic> json) {
    return SearchModel(
      token: json['token'],
    );
  }

// Phương thức sang JSON không cần thiết cho mục đích tìm kiếm
}