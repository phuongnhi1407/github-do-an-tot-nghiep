class RechargeResponse {
  String? message;
  int? statusCode;
  RechargeData? data;
  Paging? paging;

  RechargeResponse({this.message, this.statusCode, this.data, this.paging});

  RechargeResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    statusCode = json['statusCode'];
    data = json['data'] != null ? new RechargeData.fromJson(json['data']) : null;
    paging =
    json['paging'] != null ? new Paging.fromJson(json['paging']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['statusCode'] = this.statusCode;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    if (this.paging != null) {
      data['paging'] = this.paging!.toJson();
    }
    return data;
  }
}

class RechargeData {
  int? totalRows;
  int? index;
  int? userId;
  int? transactionId;
  bool? isSuccess;
  String? userFullName;
  int? point;
  String? createdDate;

  RechargeData(
      {this.totalRows,
        this.index,
        this.userId,
        this.transactionId,
        this.isSuccess,
        this.userFullName,
        this.point,
        this.createdDate});

  RechargeData.fromJson(Map<String, dynamic> json) {
    totalRows = json['totalRows'];
    index = json['index'];
    userId = json['userId'];
    transactionId = json['transactionId'];
    isSuccess = json['isSuccess'];
    userFullName = json['userFullName'];
    point = json['point'];
    createdDate = json['createdDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['totalRows'] = this.totalRows;
    data['index'] = this.index;
    data['userId'] = this.userId;
    data['transactionId'] = this.transactionId;
    data['isSuccess'] = this.isSuccess;
    data['userFullName'] = this.userFullName;
    data['point'] = this.point;
    data['createdDate'] = this.createdDate;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['totalCount'] = this.totalCount;
    data['pageIndex'] = this.pageIndex;
    data['pageSize'] = this.pageSize;
    data['totalPages'] = this.totalPages;
    return data;
  }
}