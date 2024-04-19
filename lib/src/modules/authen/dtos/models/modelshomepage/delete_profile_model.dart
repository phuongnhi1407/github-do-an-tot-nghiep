class DeleteAccountResponse {
  final String message;
  final int statusCode;
  final bool data;
  final Paging paging;

  DeleteAccountResponse({
    required this.message,
    required this.statusCode,
    required this.data,
    required this.paging,
  });

  factory DeleteAccountResponse.fromJson(Map<String, dynamic> json) {
    return DeleteAccountResponse(
      message: json['message'] ?? '',
      statusCode: json['statusCode'] ?? 0,
      data: json['data'] ?? false,
      paging: Paging.fromJson(json['paging'] ?? {}),
    );
  }
}

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
      totalCount: json['totalCount'] ?? 0,
      pageIndex: json['pageIndex'] ?? 0,
      pageSize: json['pageSize'] ?? 0,
      totalPages: json['totalPages'] ?? 0,
    );
  }
}