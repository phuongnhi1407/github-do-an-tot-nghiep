class Paging {
  final int totalCount;
  final int pageIndex;
  final int pageSize;
  final int totalPages;

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

class ForgotPasswordResponse {
  final String message;
  final int statusCode;
  final bool data;
  // final Paging paging;

  ForgotPasswordResponse({
    required this.message,
    required this.statusCode,
    required this.data,
    // required this.paging,
  });

  factory ForgotPasswordResponse.fromJson(Map<String, dynamic> json) {
    return ForgotPasswordResponse(
      message: json['message'],
      statusCode: json['statusCode'],
      data: json['data'],
      // paging: Paging.fromJson(json['paging']),
    );
  }
}
