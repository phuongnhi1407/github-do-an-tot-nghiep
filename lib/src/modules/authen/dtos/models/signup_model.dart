class SignUpResponse {
  String? message;
  int? statusCode;
  bool? data;
  Paging? paging;

  SignUpResponse({this.message, this.statusCode, this.data, this.paging});

  SignUpResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    statusCode = json['statusCode'];
    data = json['data'];
    paging = json['paging'] != null ? Paging.fromJson(json['paging']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = this.message;
    data['statusCode'] = this.statusCode;
    data['data'] = this.data;
    if (this.paging != null) {
      data['paging'] = this.paging!.toJson();
    }
    return data;
  }
}

class Paging {
  int? totalCount;
  int? pageIndex;
  int? pageSize;
  int? totalPages;

  Paging({this.totalCount, this.pageIndex, this.pageSize, this.totalPages});

  Paging.fromJson(Map<String, dynamic> json) {
    totalCount = json['totalCount'];
    pageIndex = json['pageIndex'];
    pageSize = json['pageSize'];
    totalPages = json['totalPages'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['totalCount'] = this.totalCount;
    data['pageIndex'] = this.pageIndex;
    data['pageSize'] = this.pageSize;
    data['totalPages'] = this.totalPages;
    return data;
  }
}