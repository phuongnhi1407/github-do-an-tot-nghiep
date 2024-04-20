//LogoutResponse: Là lớp model đại diện cho response của chức năng đăng xuất.
class LogoutResponse {
  String message;
  int statusCode;
  bool data;
  LogoutPaging paging;

  LogoutResponse({
    required this.message,
    required this.statusCode,
    required this.data,
    required this.paging,
  });

  factory LogoutResponse.fromJson(Map<String, dynamic> json) {
    return LogoutResponse(
      message: json['message'],
      statusCode: json['statusCode'],
      data: json['data'],
      paging: LogoutPaging.fromJson(json['paging']),
    );
  }
}
// Là lớp model đại diện cho thông tin phân trang của response
class LogoutPaging {
  int totalCount;
  int pageIndex;
  int pageSize;
  int totalPages;

  LogoutPaging({
    required this.totalCount,
    required this.pageIndex,
    required this.pageSize,
    required this.totalPages,
  });

  factory LogoutPaging.fromJson(Map<String, dynamic> json) {
    return LogoutPaging(
      totalCount: json['totalCount'],
      pageIndex: json['pageIndex'],
      pageSize: json['pageSize'],
      totalPages: json['totalPages'],
    );
  }
}