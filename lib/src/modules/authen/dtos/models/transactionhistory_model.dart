class TransactionHistoryResponse {
  List<TransactionHistoryData>? data;
  Paging? paging;
  String? message;
  int? statusCode;

  TransactionHistoryResponse({this.data, this.paging, this.message, this.statusCode});

  TransactionHistoryResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <TransactionHistoryData>[];
      json['data'].forEach((v) {
        data!.add(new TransactionHistoryData.fromJson(v));
      });
    }
    paging =
    json['paging'] != null ? new Paging.fromJson(json['paging']) : null;
    message = json['message'];
    statusCode = json['statusCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (this.paging != null) {
      data['paging'] = this.paging!.toJson();
    }
    data['message'] = this.message;
    data['statusCode'] = this.statusCode;
    return data;
  }
}

class TransactionHistoryData {
  int? index;
  int? id;
  String? transactionType;
  int? point;
  String? createdDate;
  int? totalRows;

  TransactionHistoryData(
      {this.index,
        this.id,
        this.transactionType,
        this.point,
        this.createdDate,
        this.totalRows});

  TransactionHistoryData.fromJson(Map<String, dynamic> json) {
    index = json['index'];
    id = json['id'];
    transactionType = json['transactionType'];
    point = json['point'];
    createdDate = json['createdDate'];
    totalRows = json['totalRows'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['index'] = this.index;
    data['id'] = this.id;
    data['transactionType'] = this.transactionType;
    data['point'] = this.point;
    data['createdDate'] = this.createdDate;
    data['totalRows'] = this.totalRows;
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