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

class ChangePasswordResponse {
  final String message;
  final int statusCode;
  final bool data;
  final Paging paging;

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
