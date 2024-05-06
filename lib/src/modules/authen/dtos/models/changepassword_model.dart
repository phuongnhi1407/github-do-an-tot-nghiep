class ChangePasswordResponse {
  String message;
  int statusCode;
  bool data;
  Paging paging;

  ChangePasswordResponse({
    required this.message,
    required this.statusCode,
    required this.data,
    required this.paging,
  });

  factory ChangePasswordResponse.fromJson(Map<String, dynamic> json) {
    return ChangePasswordResponse(
      message: json['message'],
      statusCode: json['statusCode'],
      data: json['data'],
      paging: Paging.fromJson(json['paging']),
    );
  }
}

class Paging {
  int totalCount;
  int pageIndex;
  int pageSize;
  int totalPages;

  Paging({
    required this.totalCount,
    required this.pageIndex,
    required this.pageSize,
    required this.totalPages,
  });

  factory Paging.fromJson(Map<String, dynamic> json) {
    return Paging(
      totalCount: json['totalCount'],
      pageIndex: json['pageIndex'],
      pageSize: json['pageSize'],
      totalPages: json['totalPages'],
    );
  }
}