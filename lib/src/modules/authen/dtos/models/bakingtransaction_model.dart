class Baking {
  BakingData? data;
  String? message;
  int? statusCode;

  Baking({this.data, this.message, this.statusCode});

  Baking.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new BakingData.fromJson(json['data']) : null;
    message = json['message'];
    statusCode = json['statusCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    data['statusCode'] = this.statusCode;
    return data;
  }
}

class BakingData {
  int? index;
  int? userId;
  int? transactionId;
  bool? isSuccess;
  String? userFullName;
  int? point;
  String? createdDate;
  int? totalRows;

  BakingData(
      {this.index,
        this.userId,
        this.transactionId,
        this.isSuccess,
        this.userFullName,
        this.point,
        this.createdDate,
        this.totalRows});

  BakingData.fromJson(Map<String, dynamic> json) {
    index = json['index'];
    userId = json['userId'];
    transactionId = json['transactionId'];
    isSuccess = json['isSuccess'];
    userFullName = json['userFullName'];
    point = json['point'];
    createdDate = json['createdDate'];
    totalRows = json['totalRows'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['index'] = this.index;
    data['userId'] = this.userId;
    data['transactionId'] = this.transactionId;
    data['isSuccess'] = this.isSuccess;
    data['userFullName'] = this.userFullName;
    data['point'] = this.point;
    data['createdDate'] = this.createdDate;
    data['totalRows'] = this.totalRows;
    return data;
  }
}