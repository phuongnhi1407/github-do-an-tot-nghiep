class DeleteAccountRequest {
  final int id;
  final bool isSuperAdmin;

  DeleteAccountRequest({
    required this.id,
    required this.isSuperAdmin,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'isSuperAdmin': isSuperAdmin,
    };
  }
}

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
      message: json['message'],
      statusCode: json['statusCode'],
      data: json['data'],
      paging: Paging.fromJson(json['paging']),
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
      totalCount: json['totalCount'],
      pageIndex: json['pageIndex'],
      pageSize: json['pageSize'],
      totalPages: json['totalPages'],
    );
  }
}